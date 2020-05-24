SAPI_EXT_PERIPH_ROOT=$(SAPI_ROOT)/external_peripherals

INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/_inc

# Display ---------------------------------------------------------------------

INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/display/fonts/inc
INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/display/fonts/greek_chars_5x7/inc
INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/display/fonts/icon_chars_5x7/inc
INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/display/lcd/inc
INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/display/led_segments/7segment/inc

SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/display/fonts/greek_chars_5x7/src/*.c)
SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/display/fonts/icon_chars_5x7/src/*.c)
SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/display/lcd/src/*.c)
SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/display/led_segments/7segment/src/*.c)

# IMU -------------------------------------------------------------------------

INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/imu/mpu60X0/inc
INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/imu/mpu9250/inc

SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/imu/mpu60X0/src/*.c)
SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/imu/mpu9250/src/*.c)

# Keypad ----------------------------------------------------------------------

INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/keypad/inc
SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/keypad/src/*.c)

# LED RGB ---------------------------------------------------------------------

INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/led_rgb/inc
SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/led_rgb/src/*.c)

# MAGNETOMETER ----------------------------------------------------------------

INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/magnetometer/hmc5883l/inc
INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/magnetometer/qmc5883l/inc

SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/magnetometer/hmc5883l/src/*.c)
SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/magnetometer/qmc5883l/src/*.c)

# MEMORY ----------------------------------------------------------------------

INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/memory/eeprom/inc
SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/memory/eeprom/src/*.c)

# MOTOR -----------------------------------------------------------------------

INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/motor/servo/inc
SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/motor/servo/src/*.c)

# Temperature and Humidity ----------------------------------------------------

INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/temperature_humudity/dht11/inc
SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/temperature_humudity/dht11/src/*.c)

# Ultrasonlic -----------------------------------------------------------------

INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/ultrasonic/hcsr04/inc
SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/ultrasonic/hcsr04/src/*.c)

# Wi-Fi -----------------------------------------------------------------------

INCLUDES+=$(SAPI_EXT_PERIPH_ROOT)/wifi/esp8266_at/inc
SOURCES+=$(wildcard $(SAPI_EXT_PERIPH_ROOT)/wifi/esp8266_at/src/*.c)
