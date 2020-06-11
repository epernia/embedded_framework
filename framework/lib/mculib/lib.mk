# Lib

SAPI_BASE=framework/lib/sapi

# Target

DEFINES+=USE_SAPI

INCLUDES+=$(SAPI_BASE)/base/inc
SOURCES+=$(wildcard $(SAPI_BASE)/base/src/*.c)

# Target

CFLAGS+=-DBOARD=$(EF_CFG_TARGET)

# Platform

SAPI_PLATFORM=$(SAPI_BASE)/platform/$(PLATFORM)
include $(SAPI_PLATFORM)/lib.mk

# Independent modules

INCLUDES+=$(SAPI_BASE)/abstract_modules/inc
SOURCES+=$(wildcard $(SAPI_BASE)/abstract_modules/src/*.c)

# External Peripherals

include $(SAPI_BASE)/external_peripherals/lib.mk
