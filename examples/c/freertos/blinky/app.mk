CONFIG_APPNAME:=freertos_blinky

COMPATIBLE_TARGETS:=edu_ciaa_nxp

#libraries used
CONFIG_LIBRARIES += os/freertos
#CONFIG_LIBRARIES += sapi

#freertos memory management option (default heap1)
#FREERTOS_HEAP_TYPE := heap_4

#source code
SOURCES+=$(CONFIG_APP_DIR)/src/main.c
SOURCES+=$(CONFIG_APP_DIR)/src/hooks.c

#include paths
INCLUDES+=$(CONFIG_APP_DIR)/inc

#SOURCES+=$(wildcard $(CONFIG_APP_DIR)/src/*.c)
#SOURCES+=$(wildcard $(CONFIG_APP_DIR)/src/*.cpp)

LDFLAGS+=-specs=nano.specs -specs=nosys.specs