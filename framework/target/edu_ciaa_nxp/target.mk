PROVIDES+=target_ciaa_edu_nxp

PLATFORM:=lpc18xx_43xx

SOURCES+=$(wildcard $(TARGET_BASE)/src/*.c)
INCLUDES+=$(TARGET_BASE)/inc

OOCD_TARGET_SCRIPTS:=
OOCD_TARGET_COMMANDS:=

RUN_GOALS:=.write_flash

OOCD:=openocd

.write_flash: .bin_goal
	@openocd -d0 -s $(TARGET_BASE)/openocd/ -f lpc4337.cfg \
		-c "init" \
		-c "halt 0" \
		-c "flash write_image erase $(BIN_GOAL) 0x1A000000 bin" \
		-c "reset run" \
		-c "shutdown"

.erase_flash: $(BIN_GOAL)

run_exec=echo "running..."
