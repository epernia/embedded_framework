PROVIDES+=compiler_gcc

CC:=$(CROSS)gcc
CXX:=$(CROSS)g++
LD:=$(CROSS)gcc
LD_CXX:=$(CROSS)g++
AS:=$(CROSS)as
AR:=$(CROSS)ar
SIZE:=$(CROSS)size
LIST:=$(CROSS)objdump
OBJCOPY:=$(CROSS)objcopy
NM:=$(CROSS)nm
GDB:=$(CROSS)gdb

COMPILER_FLAGS:=-c -MMD


ifeq ($(CONFIG_DEBUG),y)
OPT_LEVEL:=g
COMPILER_FLAGS+=-g3
else
OPT_LEVEL:=2
endif

COMPILER_FLAGS+=-O$(OPT_LEVEL)

COMPILER_CFLAGS:=$(COMPILER_FLAGS)
COMPILER_CXXFLAGS:=$(COMPILER_FLAGS)
COMPILER_ASFLAGS:=$(COMPILER_FLAGS)
COMPILER_LDFLAGS:=

build_cc = $(CC) -x c $(CFLAGS) -o $@ $<
build_cxx = $(CXX) -x c++ $(CXXFLAGS) -o $@ $<
build_as = $(AS) -x assembler-with-cpp $(ASMFLAGS) -o $@ $<
do_link = $(if $(filter %.cpp, $(SOURCES)), $(LD_CXX), $(LD)) -o $@ $(OBJS) $(LDFLAGS)

GOAL_NAME:=$(addprefix $(CONFIG_BUILDDIR)/, $(CONFIG_APPNAME))

EXEC_GOAL:=$(GOAL_NAME)$(EXEC_EXTENTION)
.exec_goal: $(EXEC_GOAL)

ALL_GOALS+=$(EXEC_GOAL)

CROSS_EXTRAS:=$(COMPILER_BASE)/$(patsubst %-,%, $(CROSS)).mk
-include $(CROSS_EXTRAS)
