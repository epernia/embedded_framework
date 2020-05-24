CONFIG_APPNAME:=emulator

COMPATIBLE_TARGETS:=pc_sim

INCLUDES+=$(CONFIG_APP_DIR)/inc
SOURCES+=$(wildcard $(CONFIG_APP_DIR)/src/*.c)
SOURCES+=$(wildcard $(CONFIG_APP_DIR)/src/*.cpp)

INCLUDES+=$(CONFIG_APP_DIR)/sapi/inc
SOURCES+=$(wildcard $(CONFIG_APP_DIR)/sapi/src/*.c)
SOURCES+=$(wildcard $(CONFIG_APP_DIR)/sapi/src/*.cpp)

CXXFLAGS+=-std=c++11
