include program.mk

.DEFAULT_GOAL: build

CONFIG_BUILDDIR?=$(CONFIG_APP_DIR)/build
CONFIG_VERBOSE?=n

ifeq ($(CONFIG_VERBOSE),y)
V:=
else
V:=@
endif

FW_BASE:=framework

ifeq ($(CONFIG_APP_DIR),)
$(error CONFIG_APP_DIR not set)
endif

include $(CONFIG_APP_DIR)/app.mk

CONFIG_TARGET?=$(firstword $(COMPATIBLE_TARGETS))

ifeq ($(CONFIG_TARGET),)
$(error CONFIG_TARGET not set)
endif

ifeq ($(findstring $(CONFIG_TARGET),$(COMPATIBLE_TARGETS)),)
ifneq ($(CONFIG_FORCE_TARGET),y)
$(info CONFIG_TARGET='$(CONFIG_TARGET)' is not in COMPATIBLE_TARGETS='$(COMPATIBLE_TARGETS)')
$(info If you realy know what you are doing, set CONFIG_FORCE_TARGET to y)
$(error Terminate with incompatible target)
endif
endif

$(info Makefile for $(CONFIG_TARGET) into $(CONFIG_APP_DIR))

TARGET_BASE:=$(FW_BASE)/target/$(CONFIG_TARGET)
include $(TARGET_BASE)/target.mk

PLATFORM_BASE:=$(FW_BASE)/platform/$(PLATFORM)
include $(PLATFORM_BASE)/platform.mk

ARCH_BASE:=$(FW_BASE)/arch/$(ARCH)
include $(ARCH_BASE)/arch.mk

COMPILER_BASE:=$(FW_BASE)/compiler/$(COMPILER)
include $(COMPILER_BASE)/compiler.mk

include _usr/usr.mk

include $(foreach l, $(CONFIG_LIBRARIES), $(FW_BASE)/lib/$(l)/lib.mk)

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

OBJECTS:=$(patsubst %.c, %.o, $(CSRC))
OBJECTS+=$(patsubst %.cpp, %.o, $(CXXSRC))
OBJECTS+=$(patsubst %.s, %.o, $(ASMSRC))
OBJECTS+=$(patsubst %.asm, %.o, $(ASMSRC))
OBJS:=$(addprefix $(CONFIG_BUILDDIR)/obj/, $(notdir $(OBJECTS)))
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
	$(V)$(RM) $(CONFIG_BUILDDIR)

define HELP_TEXT
Compilation targets

  help    Show this help
  all     Compile all goals ($(ALL_GOALS))
  build   Alias to all
  debug   Start debugger to the bin goal
  run     Execute bin goal
  clean   Clear output directory ($(CONFIG_BUILDDIR))
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
$(CONFIG_BUILDDIR)/obj:
	$(V)$(MKDIR) $@

$(CONFIG_BUILDDIR)/obj/%.o: %.c | $(CONFIG_BUILDDIR)/obj
	@echo CC $<
	$(V)$(call build_cc)

$(CONFIG_BUILDDIR)/obj/%.o: %.cpp | $(CONFIG_BUILDDIR)/obj
	@echo CXX $<
	$(V)$(call build_cxx)

$(CONFIG_BUILDDIR)/obj/%.o: %.s | $(CONFIG_BUILDDIR)/obj
	@echo ASM $<
	$(V)$(call build_asm)

$(CONFIG_BUILDDIR)/obj/%.o: %.asm | $(CONFIG_BUILDDIR)/obj
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

select_program:
	@echo SELECT
	$(V)$(SHELL) $(FW_BASE)/scripts/select-program.mk