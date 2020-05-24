CONFIG_APPNAME:=emulator

COMPATIBLE_TARGETS:=pc_sim

INCLUDES+=$(CONFIG_APP_DIR)/inc

SOURCES+=$(wildcard $(CONFIG_APP_DIR)/src/*.c)
SOURCES+=$(wildcard $(CONFIG_APP_DIR)/src/*.cpp)

CXXFLAGS+=-std=c++11
