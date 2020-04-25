# SOC
SAPI_SOC=$(SAPI_PLATFORM)/soc
 
# Core
INCLUDES+=$(SAPI_SOC)/core/inc
SOURCES+=$(wildcard $(SAPI_SOC)/core/src/*.c)

# Peripherals
INCLUDES+=$(SAPI_SOC)/peripherals/inc
SOURCES+=$(wildcard $(SAPI_SOC)/peripherals/src/*.c)

# Peripherals USB Device
INCLUDES+=$(SAPI_SOC)/peripherals/usb/device/inc
SOURCES+=$(wildcard $(SAPI_SOC)/peripherals/usb/device/src/*.c)

# Peripherals USB Host
INCLUDES+=$(SAPI_SOC)/peripherals/usb/host/inc
SOURCES+=$(wildcard $(SAPI_SOC)/peripherals/usb/host/src/*.c)
