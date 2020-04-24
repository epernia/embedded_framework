#!/bin/sh

#set -x

USEDIALOG=$(test -z $(command -v zenity) && echo y || echo n)

APPLIST=
for f in $(find . -name app.mk | cut -c 3-)
do
    NAME=$(cat ${f} | grep CONFIG_APPNAME | cut -d '=' -f 2)
    APPLIST="${APPLIST} ${NAME} $(dirname ${f})"
done

if [ "${USEDIALOG}" = "y" ]
then
    APPDIR=$(whiptail --menu "Applications" 15 60 8 ${APPLIST} 3>&1 1>&2 2>&3)
else
    APPDIR=$(zenity --title "Select" --list --print-column=2 --text "Applications" --column="Name" --column="Dir" ${APPLIST} -- 2>/dev/null)
fi
echo "Select program from ${APPDIR}"
echo "CONFIG_APP_DIR?=${APPDIR}" > program.mk
