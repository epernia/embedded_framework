PROVIDES+=platform_lpc18xx_43xx

DEFINES+=__USE_LPCOPEN
CPU:=cortex-m4
ARCH:=armv7m
COMPILER:=gcc

DEFINES+=CHIP_LPC43XX
DEFINES+=ARM_MATH_CM4
DEFINES+=CORE_M4
DEFINES+=__USE_NEWLIB

INCLUDES+=$(PLATFORM_BASE)/lpc_chip_43xx/inc
INCLUDES+=$(PLATFORM_BASE)/lpc_chip_43xx/usbd_rom

SOURCES+=$(wildcard $(PLATFORM_BASE)/lpc_startup/src/*.c)
SOURCES+=$(wildcard $(PLATFORM_BASE)/lpc_chip_43xx/src/*.c)

# option: y|n
EF_CFG_LOAD_INRAM?=n
ifeq ($(EF_CFG_LOAD_INRAM),y)
LDSCRIPT=flat.ld
else
LDSCRIPT=link.ld
endif

PLATFORM_LDFLAGS+=-L$(PLATFORM_BASE)/lib -T$(LDSCRIPT)
