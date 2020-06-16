PROVIDES+=target_pc_sim

#referencias
#https://stackoverflow.com/questions/714100/os-detecting-makefile

ifeq ($(OS),Windows_NT)
PLATFORM:=win32
else
PLATFORM:=unix
endif

#NOTA: WINDOWS NO POSEE comando "uname", pero en cygwin/mingw si. Si se ejecuta en windows, data un error pero UNAME_S quedará vacio
UNAME_S := $(shell uname)

SOURCES+=$(wildcard $(TARGET_BASE)/src/*.c)
INCLUDES+=$(TARGET_BASE)/inc

ifneq (, $(findstring Linux, $(UNAME_S)))
ENVIROMENT := Linux
else ifneq (, $(findstring CYGWIN, $(UNAME_S)))
ENVIROMENT := CYGWIN
else ifneq (, $(findstring WINDOWS, $(UNAME_S)))
ENVIROMENT := MSYS
else ifneq (, $(findstring MSYS, $(UNAME_S)))
ENVIROMENT := MSYS
else ifneq (, $(findstring MINGW, $(UNAME_S)))
ENVIROMENT := MINGW
else
ENVIROMENT := WINDOWS
endif

$(info platform: $(PLATFORM))
$(info enviroment: $(ENVIROMENT))




