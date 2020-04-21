#!/bin/sh

set -x
set -e

APP_DIR=$(find . -name 'app.mk' -exec dirname '{}' \;)
for d in ${APP_DIR}
do
    echo "**** Compiling app in ${d} *****"
    make CONFIG_APP_DIR=$d clean
    make CONFIG_APP_DIR=$d build
    make CONFIG_APP_DIR=$d clean
done
