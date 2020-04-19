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


ifeq ($(CONFIG_LOAD_INRAM),y)
LDSCRIPT=flat.ld
else
LDSCRIPT=link.ld
endif

PLATFORM_LDFLAGS+=-L$(PLATFORM_BASE)/lib -T$(LDSCRIPT)

RUN_GOALS:=.write_flash

OOCD:=openocd

.write_flash: .bin_goal
	@openocd -d0 -f $(PLATFORM_BASE)/lpc4337.cfg \
		-c "init" \
		-c "halt 0" \
		-c "flash write_image erase $(BIN_GOAL) 0x1A000000 bin" \
		-c "reset run" \
		-c "shutdown"

.erase_flash: $(BIN_GOAL)

run_exec=echo "running..."
