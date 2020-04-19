PROVIDES+=compiler_arm_none_eabi libc_newlib

BIN_GOAL:=$(GOAL_NAME).bin
HEX_GOAL:=$(GOAL_NAME).hex
LST_GOAL:=$(GOAL_NAME).lst

MAP_NAME:=$(GOAL_NAME).map

COMPILER_LDFLAGS:=-Wl,-Map=$(MAP_NAME) -Wl,--cref -Wl,--print-memory-usage

ALL_GOALS+=$(BIN_GOAL) $(HEX_GOAL) $(LST_GOAL)

$(BIN_GOAL): $(EXEC_GOAL)
	@echo BIN $@
	$(V)$(OBJCOPY) -O binary $< $@
.bin_goal: $(BIN_GOAL)

$(HEX_GOAL): $(EXEC_GOAL)
	@echo HEX $@
	$(V)$(OBJCOPY) -O ihex $< $@
.hex_goal: $(HEX_GOAL)

$(LST_GOAL): $(EXEC_GOAL)
	@echo LIST $<
	$(V)$(LIST) -xdS $< > $@
.lst_goal: $(LST_GOAL)
