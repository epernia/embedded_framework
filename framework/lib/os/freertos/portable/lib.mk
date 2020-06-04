#referencias:
#port para posix cortesia de https://github.com/michaelbecker/freertos-addons

ifeq ($(PLATFORM),lpc18xx_43xx)
#no agregue la opcion de FPU, como en fwv3
SOURCES+=$(wildcard $(FREERTOS_ROOT)/portable/$(COMPILER)/ARM_CM3/*.c)
INCLUDES+=$(FREERTOS_ROOT)/portable/$(COMPILER)/ARM_CM3
endif

ifeq ($(PLATFORM),win32)

ifeq ($(ENVIROMENT),WINDOWS)
$(info FreeRTOS demo for $(PLATFORM) and $(ENVIROMENT) is not implemented.)
endif

ifeq ($(ENVIROMENT),CYGWIN)
#CYGWIN uses the same posix port
SOURCES+=$(wildcard $(FREERTOS_ROOT)/portable/$(COMPILER)/posix/*.c)
INCLUDES+=$(FREERTOS_ROOT)/portable/$(COMPILER)/posix
CFLAGS += -pthread
LDFLAGS+= -pthread
endif

ifeq ($(ENVIROMENT),MINGW)
$(error FreeRTOS demo for $(PLATFORM) and $(ENVIROMENT) is not implemented yet.)
SOURCES+=$(wildcard $(FREERTOS_ROOT)/portable/MSVC-MingW/*.c)
INCLUDES+=$(FREERTOS_ROOT)/portable/MSVC-MingW
endif

ifeq ($(ENVIROMENT),MYSYS)
$(error FreeRTOS demo for $(PLATFORM) and $(ENVIROMENT) is not implemented yet.)
endif

endif

ifeq ($(PLATFORM),unix)
SOURCES+=$(wildcard $(FREERTOS_ROOT)/portable/$(COMPILER)/posix/*.c)
INCLUDES+=$(FREERTOS_ROOT)/portable/$(COMPILER)/posix
CFLAGS += -pthread
LDFLAGS+= -pthread
endif




