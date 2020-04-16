# Compilation and libraries configurations -----------------------------

# Compilation and libraries default values

# Compile options
USE_NANO=n
USE_LTO=n
SEMIHOST=n
USE_FPU=y
# Libraries
USE_LPCOPEN=y
USE_SAPI=y

# -----------------------

EXTENSION=.elf

TARGET_LDFLAGS:=-T$(LDSCRIPT)
TARGET_LDFLAGS+=-nostartfiles -Wl,-gc-sections -Wl,-Map=$(APP_MAP) -Wl,--cref

CROSS=arm-none-eabi-

