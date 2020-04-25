#!/bin/sh

#set -x
set -e

HAVEZENITY=$(test -z $(command -v zenity) && echo n || echo y)
WITHDISPLAY=$(test -z ${DISPLAY} && echo n || echo y)
USEZENITY="x${HAVEZENITY}${WITHDISPLAY}"
echo "Parameter count: $#"
for arg in $@
do
    if [ "x$arg" = "x--force-zenity" ]
    then
        USEZENITY="xyy"
    fi
done

APPDIRLIST=$(find . -name app.mk | cut -c 3-)
APPLIST=
for f in ${APPDIRLIST}
do
    APPLIST="${APPLIST} $(dirname ${f})"
    if [ ${USEZENITY} != "xyy" ]
    then
        APPLIST="${APPLIST} ${f}"
    fi
done

if [ "${USEZENITY}" = "xyy" ]
then
    APPDIR=$(zenity --title "Select" --list --text "Applications" --column="App dir" ${APPLIST} -- 2>/dev/null)
else
    APPDIR=$(whiptail --noitem --menu "Applications" 15 40 8 ${APPLIST} 3>&1 1>&2 2>&3)
fi

if [ -z ${APPDIR} ]
then
    echo "Canceled"
    exit 0
fi

if [ ! -f ${APPDIR}/app.mk ]
then
    echo "not an application"
    exit -1
fi

echo "Select program from ${APPDIR}"
echo "CONFIG_APP_DIR:=${APPDIR}" > program.mk
