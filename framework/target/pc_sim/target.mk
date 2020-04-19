PROVIDES+=target_pc_sim

ifeq ($(OS),Windows_NT)
PLATFORM:=win32
else
PLATFORM:=unix
endif

SOURCES+=$(wildcard $(TARGET_BASE)/src/*.c)
INCLUDES+=$(TARGET_BASE)/inc
