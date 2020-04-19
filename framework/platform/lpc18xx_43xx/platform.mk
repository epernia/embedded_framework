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
OOCD_PARAMS=-d0 -f $(PLATFORM_BASE)/lpc4337.cfg
OOCD_PARAMS+=-c "init"
OOCD_PARAMS+=-c "halt 0"
OOCD_PARAMS+=-c "flash write_image erase $(BIN_GOAL) 0x1A000000 bin"
OOCD_PARAMS+=-c "reset run"
OOCD_PARAMS+=-c "shutdown"
$(info $(EXEC_GOAL) $(BIN_GOAL))
.write_flash: .all
	@openocd $(OOCD_PARAMS)

.erase_flash: $(BIN_GOAL)

run_exec=echo "running..."
