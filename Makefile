-include program.mk

.DEFAULT_GOAL: build

FW_BASE:=framework

# type: string
EF_CFG_APPNAME?=
# type: path
EF_CFG_APP_DIR?=examples/c/app
# type: path
EF_CFG_BUILDDIR?=$(EF_CFG_APP_DIR)/build
# option: y|n
EF_CFG_VERBOSE?=n

ifeq ($(EF_CFG_VERBOSE),y)
V:=
else
V:=@
endif

ifeq ($(wildcard program.mk),)
$(info Makefile not configured)
endif

ifeq ($(EF_CFG_APP_DIR),)
$(error EF_CFG_APP_DIR not set)
endif

include $(EF_CFG_APP_DIR)/app.mk

# type: targetname
EF_CFG_TARGET?=$(firstword $(COMPATIBLE_TARGETS))

ifeq ($(EF_CFG_TARGET),)
$(error EF_CFG_TARGET not set)
endif

ifeq ($(findstring $(EF_CFG_TARGET),$(COMPATIBLE_TARGETS)),)
ifneq ($(EF_CFG_FORCE_TARGET),y)
$(info EF_CFG_TARGET='$(EF_CFG_TARGET)' is not in COMPATIBLE_TARGETS='$(COMPATIBLE_TARGETS)')
$(info If you realy know what you are doing, set EF_CFG_FORCE_TARGET to y)
$(error Terminate with incompatible target)
endif
endif

$(info Makefile for $(EF_CFG_TARGET) into $(EF_CFG_APP_DIR))

TARGET_BASE:=$(FW_BASE)/target/$(EF_CFG_TARGET)
include $(TARGET_BASE)/target.mk

PLATFORM_BASE:=$(FW_BASE)/platform/$(PLATFORM)
include $(PLATFORM_BASE)/platform.mk

ARCH_BASE:=$(FW_BASE)/arch/$(ARCH)
include $(ARCH_BASE)/arch.mk

COMPILER_BASE:=$(FW_BASE)/compiler/$(COMPILER)
include $(COMPILER_BASE)/compiler.mk

include _usr/usr.mk

LIB_BASE=$(FW_BASE)/lib
EF_CFG_LIBRARIES?=   # expect: libname
include $(foreach l, $(EF_CFG_LIBRARIES), $(LIB_BASE)/$(l)/lib.mk)

INC_FLAGS:=$(addprefix -I, $(INCLUDES))
DEF_FLAGS:=$(addprefix -D, $(DEFINES))

CFLAGS+=$(ARCH_CFLAGS) $(PLATFORM_CFLAGS) $(COMPILER_CFLAGS)
CFLAGS+=$(INC_FLAGS) $(DEF_FLAGS)

CXXFLAGS+=$(ARCH_CXXFLAGS) $(PLATFORM_CXXFLAGS) $(COMPILER_CXXFLAGS)
CXXFLAGS+=$(INC_FLAGS) $(DEF_FLAGS)

LDFLAGS+=$(ARCH_LDFLAGS) $(PLATFORM_LDFLAGS) $(COMPILER_LDFLAGS)

CSRC:=$(filter %.c, $(SOURCES))
CXXSRC:=$(filter %.cpp, $(SOURCES))
ASMSRC:=$(filter %.s, $(SOURCES))
ASMSRC2:=$(filter %.asm, $(SOURCES))
ASMSRC3:=$(filter %.S, $(SOURCES))

OBJECTS:=$(patsubst %.c, %.o, $(CSRC))
OBJECTS+=$(patsubst %.cpp, %.o, $(CXXSRC))
OBJECTS+=$(patsubst %.s, %.o, $(ASMSRC))
OBJECTS+=$(patsubst %.S, %.o, $(ASMSRC3))
OBJECTS+=$(patsubst %.asm, %.o, $(ASMSRC))
OBJS:=$(addprefix $(EF_CFG_BUILDDIR)/obj/, $(notdir $(OBJECTS)))
SRCDIR:=$(sort $(dir $(SOURCES)))

DEPS:=$(patsubst %.o, %.d, $(OBJS))
VPATH:=$(SRCDIR)

MKDIR:=mkdir -p
RM:=rm -fr

build: .all_goals

.all_goals: $(ALL_GOALS)
	@echo DONE

clean:
	@echo CLEAN
	$(V)$(RM) $(EF_CFG_BUILDDIR)
# TODO: add clean_all target

define HELP_TEXT
Compilation targets

  help    Show this help
  all     Compile all goals ($(ALL_GOALS))
  build   Alias to all
  debug   Start debugger to the bin goal
  run     Execute bin goal
  clean   Clear output directory ($(EF_CFG_BUILDDIR))
endef
export HELP_TEXT

info:
	@echo "$$HELP_TEXT"
	@echo "$$ARCH_HELP_TEXT"
	@echo "$$PLATFORM_HELP_TEXT"
	@echo sAPI library
	@echo Platform: $(PLATFORM)
	@echo Target: $(BOARD)
#
#provides:
#	@echo Provides:
#	@echo $(PROVIDES) | tr ' ' '\n'
#
#variables:
#	@echo ALL GOALS: $(ALL_GOALS)
#	@echo CFLAGS: $(CFLAGS)
#	@echo CSRC: $(CSRC)
#	@echo CXXSRC: $(CXXSRC)
#	@echo LDFLAGS: $(LDFLAGS)
#	@echo compiler $(CC)
#	@echo OBJS: $(OBJS)
#	@echo OBJECTS: $(OBJECTS)
#	@echo DEPS: $(DEPS)
#	@echo VPATH: $(VPATH)
#
$(EF_CFG_BUILDDIR)/obj:
	$(V)$(MKDIR) $@

$(EF_CFG_BUILDDIR)/obj/%.o: %.c | $(EF_CFG_BUILDDIR)/obj
	@echo CC $<
	$(V)$(call build_cc)

$(EF_CFG_BUILDDIR)/obj/%.o: %.cpp | $(EF_CFG_BUILDDIR)/obj
	@echo CXX $<
	$(V)$(call build_cxx)

$(EF_CFG_BUILDDIR)/obj/%.o: %.s | $(EF_CFG_BUILDDIR)/obj
	@echo ASM $<
	$(V)$(call build_asm)

$(EF_CFG_BUILDDIR)/obj/%.o: %.asm | $(EF_CFG_BUILDDIR)/obj
	@echo ASM $<
	$(V)$(call build_asm)

$(EF_CFG_BUILDDIR)/obj/%.o: %.S | $(EF_CFG_BUILDDIR)/obj
	@echo ASM $<
	$(V)$(call build_asm)

$(EXEC_GOAL): $(OBJS)
	@echo LINK $<
	$(V)$(call do_link)
.exec_goal: $(EXEC_GOAL)

run: $(RUN_GOALS)
	@echo RUN
	$(call run_exec)

debug: .exec_goal
	@echo DEBUG
	$(V)$(call debug_exec)

ifeq ($(OS),Windows_NT)
SELECT_PROGRAM_FLAGS:=--force-zenity
else
SELECT_PROGRAM_FLAGS:=
endif

select_program:
	@echo SELECT
	$(V)$(SHELL) $(FW_BASE)/scripts/select-program.sh $(SELECT_PROGRAM_FLAGS)
