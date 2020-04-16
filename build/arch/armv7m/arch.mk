ARCH_FLAGS:=-mcpu=$(CPU) -mthumb

ifeq ($(CONFIG_USE_FPU),y)
DEFINES+=__FPU_PRESENT=1U
ARCH_FLAGS+=-mfloat-abi=hard -mfpu=fpv4-sp-d16
else
DEFINES+=__FPU_PRESENT=OU
endif

ARCH_FLAGS+=-ffunction-sections -fdata-sections

SOURCES+=$(ARCH_BASE)/cmsis_core/src/armv7m_startup.c
INCLUDES+=$(ARCH_BASE)/cmsis_core/inc

ARCH_CFLAGS:=$(ARCH_FLAGS)
ARCH_CXXFLAGS:=$(ARCH_FLAGS)
ARCH_LDFLAGS:=$(ARCH_FLAGS)
ARCH_LDFLAGS+=-nostartfiles -Wl,-gc-sections

CROSS:=arm-none-eabi-
EXEC_EXTENTION:=elf
