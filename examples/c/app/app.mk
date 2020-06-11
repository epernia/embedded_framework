EF_CFG_APPNAME:=app

# Warning: This is unreal, the targets are incompatible by default
TARGET_DIR:=$(FW_BASE)/target/

COMPATIBLE_TARGETS:=$(patsubst $(TARGET_DIR)/%,%,$(wildcard $(TARGET_DIR)/*))

SOURCES+=$(EF_CFG_APP_DIR)/src/main.c
