EF_CFG_APPNAME:=emulator

COMPATIBLE_TARGETS:=pc_sim

INCLUDES+=$(EF_CFG_APP_DIR)/inc
SOURCES+=$(wildcard $(EF_CFG_APP_DIR)/src/*.c)
SOURCES+=$(wildcard $(EF_CFG_APP_DIR)/src/*.cpp)

INCLUDES+=$(EF_CFG_APP_DIR)/sapi/inc
SOURCES+=$(wildcard $(EF_CFG_APP_DIR)/sapi/src/*.c)
SOURCES+=$(wildcard $(EF_CFG_APP_DIR)/sapi/src/*.cpp)

CXXFLAGS+=-std=c++11
