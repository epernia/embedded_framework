$(ARCH)_FLAGS:=-mcpu=$(CPU) -mthumb
$(ARCH)_DEFINES+=__FPU_PRESENT=OU

CROSS:=arm-none-eabi-
