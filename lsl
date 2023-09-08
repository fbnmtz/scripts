#!/usr/bin/env bash
#
# ############################################################################
# Project: scripts (none)
# File...: lsl
# Created: Thursday, 2023/10/01 - 10:40:58
# Author.: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Friday, 2023/09/08 - 01:35:56
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.1.1.7
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  > list links in a directory
# ############################################################################
# HISTORY:
#

if [ "$1" != "" ]; then
    dir=$1
else
    dir=$(pwd)
fi

data=$(ls -la $dir | grep '^l' | awk '{printf("%s:%s\n",$9,$11)}')
header=$(echo "[link]:[target]")
echo " -- List Link's --"
echo -e "$header\n$data" | column -t -s ':' 