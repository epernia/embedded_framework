-include $(wildcard lib/*/lib.mk)

INCLUDES+=$(wildcard lib/*/inc)
SOURCES+=$(wildcard lib/*/src/*.c)
SOURCES+=$(wildcard lib/*/src/*.cpp)
SOURCES+=$(wildcard lib/*/src/*.s)
