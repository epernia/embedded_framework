PROVIDES+=target_bluepill

PLATFORM:=stm32f1
ST_PART:=STM32F103xB

SOURCES+=$(wildcard $(TARGET_BASE)/src/*.c)
INCLUDES+=$(TARGET_BASE)/inc

RUN_GOALS=$(EXEC_GOAL)

OOCD:=openocd

run_exec=openocd -d0 -f $(TARGET_BASE)/bluepill.cfg -c "program $(EXEC_GOAL) verify reset exit"
