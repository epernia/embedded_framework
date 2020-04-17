all: .all

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
ASMSRC2:=$(filter %.S, $(SOURCES))

OBJECTS:=$(patsubst %.c, %.o, $(CSRC))
OBJECTS+=$(patsubst %.cpp, %.o, $(CXXSRC))
OBJECTS+=$(patsubst %.s, %.o, $(ASMSRC))
OBJECTS+=$(patsubst %.S, %.o, $(ASMSRC2))
OBJS:=$(addprefix $(CONFIG_BUILDDIR)/obj/, $(notdir $(OBJECTS)))
SRCDIR:=$(sort $(dir $(SOURCES)))

DEPS:=$(patsubst %.o, %.d, $(OBJS))
VPATH:=$(SRCDIR)

MKDIR:=mkdir -p
RM:=rm -fr

.all: $(ALL_GOALS)
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

provides:
	@echo Provides:
	@echo $(PROVIDES) | tr ' ' '\n'

info:
	@echo ALL GOALS: $(ALL_GOALS)
	@echo CFLAGS: $(CFLAGS)
	@echo CSRC: $(CSRC)
	@echo CXXSRC: $(CXXSRC)
	@echo LDFLAGS: $(LDFLAGS)
	@echo compiler $(CC)
	@echo OBJS: $(OBJS)
	@echo OBJECTS: $(OBJECTS)
	@echo DEPS: $(DEPS)
	@echo VPATH: $(VPATH)

$(CONFIG_BUILDDIR)/obj:
	$(V)$(MKDIR) $@

$(CONFIG_BUILDDIR)/obj/%.o: %.c | $(CONFIG_BUILDDIR)/obj
	@echo CC $<
	$(V)$(call build_cc)

$(CONFIG_BUILDDIR)/obj/%.o: %.cpp | $(CONFIG_BUILDDIR)/obj
	@echo CXX $<
	$(V)$(call build_cxx)

$(EXEC_GOAL): $(OBJS)
	@echo LINK $<
	$(V)$(call do_link)
