# Compilation and libraries configurations -----------------------------

# Compilation and libraries default values

# Libraries
#USE_SAPI=y

ARCH = ia32
PLATFORM =  

# -----------------------

ifeq ($(OS),Windows_NT)
EXTENSION:=.exe
else
EXTENSION=
endif

TARGET_LDFLAGS=

CROSS=

