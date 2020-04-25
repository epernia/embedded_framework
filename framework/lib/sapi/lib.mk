# sAPI library
#SAPI_VERSION="sAPI v0.5.2"
SAPI_ROOT=$(LIB_BASE)/sapi

DEFINES+=USE_SAPI

# Target
CFLAGS+=-DBOARD=$(CONFIG_TARGET)

# Platform
SAPI_PLATFORM=$(SAPI_ROOT)/platform/$(PLATFORM)
include $(SAPI_PLATFORM)/lib.mk

# Base
DEFINES+=USE_SAPI
include $(SAPI_ROOT)/base/lib.mk

# Independent modules
include $(SAPI_ROOT)/modules/lib.mk

# External Peripherals
include $(SAPI_ROOT)/external_peripherals/lib.mk
