# Base
INCLUDES+=$(SAPI_PLATFORM)/base/inc
SOURCES+=$(wildcard $(SAPI_PLATFORM)/base/src/*.c)

# Board
INCLUDES+=$(SAPI_PLATFORM)/board/inc
SOURCES+=$(wildcard $(SAPI_PLATFORM)/board/src/*.c)

# SOC Core
include $(SAPI_PLATFORM)/soc/lib.mk
