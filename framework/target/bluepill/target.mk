PROVIDES+=target_bluepill

PLATFORM:=stm32f1
ST_PART:=STM32F103xB

SOURCES+=$(wildcard $(TARGET_BASE)/src/*.c)
INCLUDES+=$(TARGET_BASE)/inc

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
