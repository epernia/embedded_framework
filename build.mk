ifeq ($(CONFIG_TARGET),)
$(error Not configured)
endif

ifeq ($(CONFIG_VERBOSE),y)
V:=
else
V:=@
endif

TARGET_BASE:=build/target/$(CONFIG_TARGET)
include $(TARGET_BASE)/target.mk

PLATFORM_BASE:=build/platform/$(PLATFORM)
include $(PLATFORM_BASE)/platform.mk

ARCH_BASE:=build/arch/$(ARCH)
include $(ARCH_BASE)/arch.mk

COMPILER_BASE:=build/compilers/$(COMPILER)
include $(COMPILER_BASE)/compiler.mk

include $(CONFIG_APP_DIR)/app.mk

CFLAGS+=$(ARCH_CFLAGS) $(PLATFORM_CFLAGS) $(COMPILER_CFLAGS)
CFLAGS+=$(addprefix -I, $(INCLUDES))
CFLAGS+=$(addprefix -D, $(DEFINES))

LDFLAGS+=$(ARCH_LDFLAGS) $(PLATFORM_LDFLAGS) $(COMPILER_LDFLAGS)

C_EXT:=c
CXX_EXT:=cpp cxx cc
ASM_EXT:=s S asm

CSRC:=$(foreach e, $(C_EXT), $(filter %.$(e), $(SOURCES)))
CXXSRC:=$(foreach e, $(CXX_EXT), $(filter %.$(e), $(SOURCES)))
ASMSRC:=$(foreach e, $(ASM_EXT), $(filter %.$(e), $(SOURCES)))

OBJECTS:=$(foreach e, $(C_EXT), $(patsubst %.$(e), %.o, $(CSRC)))
OBJECTS+=$(foreach e, $(CXX_EXT), $(patsubst %.$(e), %.o, $(CXXSRC)))
OBJECTS+=$(foreach e, $(ASM_EXT), $(patsubst %.$(e), %.o, $(ASMSRC)))
OBJS:=$(addprefix $(CONFIG_BUILDDIR)/obj/, $(notdir $(OBJECTS)))
SRCDIR:=$(sort $(dir $(SOURCES)))

DEPS:=$(patsubst %.o, %.d, $(OBJS))
VPATH:=$(SRCDIR)

MKDIR:=mkdir -p
RM:=rm -fr

all: $(ALL_GOALS)
	@echo DONE

clean:
	@echo CLEAN
	$(V)$(RM) $(CONFIG_BUILDDIR)

define HELP_TEXT
Compilation targets

  help    Show this help
  all     Compile all goals ($(ALL_GOALS))
  clean   Clear output directory ($(CONFIG_BUILDDIR))
endef
export HELP_TEXT

help:
	@echo "$$HELP_TEXT"
	@echo "$$ARCH_HELP_TEXT"
	@echo "$$PLATFORM_HELP_TEXT"

.info:
	@echo ALL GOALS: $(ALL_GOALS)
	@echo CFLAGS: $(CFLAGS)
	@echo CSRC: $(CSRC)
	@echo LDFLAGS: $(LDFLAGS)
	@echo compiler $(CC)
	@echo OBJS: $(OBJS)
	@echo DEPS: $(DEPS)
	@echo VPATH: $(VPATH)

$(CONFIG_BUILDDIR)/obj: $(CONFIG_BUILDDIR)
	$(V)$(MKDIR) $@

$(CONFIG_BUILDDIR)/obj/%.o: %.c | $(CONFIG_BUILDDIR)/obj
	@echo CC $<
	$(V)$(call build_cc $@ $<)

$(EXEC_GOAL): $(OBJS)
	@echo LINK $@
	$(V)$(call do_link $@)
