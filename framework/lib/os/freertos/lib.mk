# sAPI library
#SAPI_VERSION="sAPI v0.5.2"
FREERTOS_ROOT=$(LIB_BASE)/os/freertos

FREERTOS_HEAP_TYPE?= heap_1

DEFINES+=USE_FREERTOS

# Target
CFLAGS += -DBOARD=$(EF_CFG_TARGET)

# Platform
include $(FREERTOS_ROOT)/portable/lib.mk

#SAPI_PLATFORM=$(SAPI_ROOT)/platform/$(PLATFORM)
#include $(SAPI_PLATFORM)/lib.mk

# Base
INCLUDES+=$(FREERTOS_ROOT)/include
SOURCES+=$(wildcard $(FREERTOS_ROOT)/*.c)

#memory management algorithm
SOURCES+=$(FREERTOS_ROOT)/portable/MemMang/$(FREERTOS_HEAP_TYPE).c


