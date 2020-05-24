SAPI_MODULES=$(SAPI_ROOT)/modules

INCLUDES+=$(SAPI_MODULES)/_inc

# Button ----------------------------------------------------------------------

INCLUDES+=$(SAPI_MODULES)/button/inc
SOURCES+=$(wildcard $(SAPI_MODULES)/button/src/*.c)

# Circular buffer -------------------------------------------------------------

INCLUDES+=$(SAPI_MODULES)/circular_buffer/inc
SOURCES+=$(wildcard $(SAPI_MODULES)/circular_buffer/src/*.c)
