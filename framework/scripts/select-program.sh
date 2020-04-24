#!/bin/sh

# set -x

HAVEZENITY=$(test -z $(command -v zenity) && echo n || echo y)
WITHDISPLAY=$(test -z ${DISPLAY} && echo n || echo y)
USEZENITY="x${HAVEZENITY}${WITHDISPLAY}"

APPLIST=
for f in $(find . -name app.mk | cut -c 3-)
do
    NAME=$(cat ${f} | grep CONFIG_APPNAME | cut -d '=' -f 2)
    APPLIST="${APPLIST} ${NAME} $(dirname ${f})"
done

if [ "${USEZENITY}" = "xyy" ]
then
    APPDIR=$(zenity --title "Select" --list --print-column=2 --text "Applications" --column="Name" --column="Dir" ${APPLIST} -- 2>/dev/null)
else
    APPDIR=$(whiptail --menu "Applications" 15 60 8 ${APPLIST} 3>&1 1>&2 2>&3)
fi
echo "Select program from ${APPDIR}"
echo "CONFIG_APP_DIR?=${APPDIR}" > program.mk
