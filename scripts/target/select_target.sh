#!/bin/sh

# BSD 3-Clause License
# Copyright (c) 2019, Eric Pernia
# All rights reserved.

#set -x

# Script folder path
SB=$(dirname $(readlink -f $0))

# Repository root folder path
B=$(readlink -f ${SB}/../../)

# Repository root folder name
REPO_FOLDER=$(basename $B)

echo ""
echo "Select target wizard is starting..."
echo ""

TARGETS_FILE=${B}/libs/sapi/sapi_v0.5.2/target/inc/sapi_targets.h
TARGETS_LIST=$(cat ${TARGETS_FILE}|grep -iE '#define \S+\s+[0-9]+'|awk '{print $2}')

echo $TARGETS_LIST

TARGETS_LIST="pc_sim edu_ciaa_nxp ciaa_nxp"

FORM_SELECT_TARGET=$(zenity --list --title="Select target" \
    --text="Select a target" --column="Target name" \
    ${TARGETS_LIST})

RET=$?


case $RET in
	0)
	SELECTED_TARGET=$(echo $FORM_SELECT_TARGET | cut -d '|' -f 1)
	cat <<EOF > ${B}/target.mk
#==============================================================================
# Select a target. Available Targets:
#
#  - ciaa_sim_ia32        ---> Not supported yet!
#  - ciaa_sim_ia64        ---> Not supported yet!
#  - ciaa_nxp           
#  - edu_ciaa_nxp       
#  - ciaa_fsl             ---> Not supported yet!
#  - ciaa_pic             ---> Not supported yet!
#  - pico_ciaa            ---> Not supported yet!
#  - ciaa_leon3_fpga_nfp  ---> Not supported yet!
#  - ciaa_z3r0            ---> Not supported yet!
#  - ciaa_7st             ---> Not supported yet!
#
# Remember to clean program if change the target!
#==============================================================================

TARGET = ${SELECTED_TARGET}
EOF
	echo "Selected target:"
 	echo " - $SELECTED_TARGET"
	echo ""
	echo "File changed sucessfull:"
	echo "${B}/target.mk"
	;;
	1)
		echo "Aborted by user."
		exit 0;;
	-1)
		echo "Unexpected error.";;
esac

# See: https://bioinf.comav.upv.es/courses/unix/scripts_bash.html
