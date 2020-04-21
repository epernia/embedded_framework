#ifeq ($(USE_SAPI),y)

SAPI_BASE=framework/lib/sapi/impl/$(PLATFORM)
#$(info $(SAPI_BASE))

DEFINES+=USE_SAPI

CFLAGS+=-DBOARD=$(CONFIG_TARGET)

INCLUDES+=$(SAPI_BASE)/base/inc
SOURCES+=$(wildcard $(SAPI_BASE)/base/src/*.c)

INCLUDES+=$(SAPI_BASE)/soc/core/inc
SOURCES+=$(wildcard $(SAPI_BASE)/soc/core/src/*.c)

INCLUDES+=$(SAPI_BASE)/soc/peripherals/inc
SOURCES+=$(wildcard $(SAPI_BASE)/soc/peripherals/src/*.c)

INCLUDES+=$(SAPI_BASE)/soc/peripherals/usb/device/inc
SOURCES+=$(wildcard $(SAPI_BASE)/soc/peripherals/usb/device/src/*.c)

INCLUDES+=$(SAPI_BASE)/soc/peripherals/usb/host/inc
SOURCES+=$(wildcard $(SAPI_BASE)/soc/peripherals/usb/host/src/*.c)

INCLUDES+=$(SAPI_BASE)/board/inc
SOURCES+=$(wildcard $(SAPI_BASE)/board/src/*.c)

INCLUDES+=$(SAPI_BASE)/abstract_modules/inc
SOURCES+=$(wildcard $(SAPI_BASE)/abstract_modules/src/*.c)

# External Peripherals
include $(SAPI_BASE)/external_peripherals/lib.mk

#endif
