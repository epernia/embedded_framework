EXTERNAL_PERIPH_BASE=$(SAPI_BASE)/external_peripherals

# Display ---------------------------------------------------------------------

INCLUDES+=$(EXTERNAL_PERIPH_BASE)/display/fonts/inc
INCLUDES+=$(EXTERNAL_PERIPH_BASE)/display/fonts/greek_chars_5x7/inc
INCLUDES+=$(EXTERNAL_PERIPH_BASE)/display/fonts/icon_chars_5x7/inc
INCLUDES+=$(EXTERNAL_PERIPH_BASE)/display/lcd/inc
INCLUDES+=$(EXTERNAL_PERIPH_BASE)/display/led_segments/7segment/inc

SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/display/fonts/greek_chars_5x7/src/*.c)
SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/display/fonts/icon_chars_5x7/src/*.c)
SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/display/lcd/src/*.c)
SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/display/led_segments/7segment/src/*.c)

# IMU -------------------------------------------------------------------------

INCLUDES+=$(EXTERNAL_PERIPH_BASE)/imu/mpu60X0/inc
INCLUDES+=$(EXTERNAL_PERIPH_BASE)/imu/mpu9250/inc

SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/imu/mpu60X0/src/*.c)
SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/imu/mpu9250/src/*.c)

# Keypad ----------------------------------------------------------------------

INCLUDES+=$(EXTERNAL_PERIPH_BASE)/keypad/inc
SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/keypad/src/*.c)

# LED RGB ---------------------------------------------------------------------

INCLUDES+=$(EXTERNAL_PERIPH_BASE)/led_rgb/inc
SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/led_rgb/src/*.c)

# MAGNETOMETER ----------------------------------------------------------------

INCLUDES+=$(EXTERNAL_PERIPH_BASE)/magnetometer/hmc5883l/inc
INCLUDES+=$(EXTERNAL_PERIPH_BASE)/magnetometer/qmc5883l/inc

SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/magnetometer/hmc5883l/src/*.c)
SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/magnetometer/qmc5883l/src/*.c)

# MEMORY ----------------------------------------------------------------------

INCLUDES+=$(EXTERNAL_PERIPH_BASE)/memory/eeprom/inc
SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/memory/eeprom/src/*.c)

# MOTOR -----------------------------------------------------------------------

INCLUDES+=$(EXTERNAL_PERIPH_BASE)/motor/servo/inc
SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/motor/servo/src/*.c)

# Temperature and Humidity ----------------------------------------------------

INCLUDES+=$(EXTERNAL_PERIPH_BASE)/temperature_humudity/dht11/inc
SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/temperature_humudity/dht11/src/*.c)

# Ultrasonlic -----------------------------------------------------------------

INCLUDES+=$(EXTERNAL_PERIPH_BASE)/ultrasonic/hcsr04/inc
SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/ultrasonic/hcsr04/src/*.c)

# Wi-Fi -----------------------------------------------------------------------

INCLUDES+=$(EXTERNAL_PERIPH_BASE)/wifi/esp8266_at/inc
SOURCES+=$(wildcard $(EXTERNAL_PERIPH_BASE)/wifi/esp8266_at/src/*.c)
