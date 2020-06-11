EF_CFG_APPNAME:=freertos_blinky

COMPATIBLE_TARGETS:=pc_sim

#libraries used
EF_CFG_LIBRARIES += os/freertos
#EF_CFG_LIBRARIES += sapi

#freertos memory management option (default heap1)
#FREERTOS_HEAP_TYPE := heap_4

#source code
SOURCES+=$(EF_CFG_APP_DIR)/src/main.c
SOURCES+=$(EF_CFG_APP_DIR)/src/hooks.c

#include paths
INCLUDES+=$(EF_CFG_APP_DIR)/inc

#SOURCES+=$(wildcard $(EF_CFG_APP_DIR)/src/*.c)
#SOURCES+=$(wildcard $(EF_CFG_APP_DIR)/src/*.cpp)

