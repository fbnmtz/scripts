#!/usr/bin/env bash
#
# ############################################################################
# Project: scripts (none)
# File...: aw
# Created: Thursday, 2020/09/22 - 12:58:16
# Author.: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Friday, 2023/05/26 - 23:41:21
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 1.0.1.22
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  > wrapper for awk command
# ############################################################################
# HISTORY:
#

if [[ "$@" =~ "-" ]];then
  # has an interval to cut?
  fst=$(echo $1 | cut -d '-' -f1)
  lst=$(echo $1 | cut -d '-' -f2)
  awk_args=' BEGIN { 
      first = '$fst'; last = '$lst' \
    } { \
    for (i = first; i < last; i++) { \
        printf("%10s ", $i) \
    } printf("%10s", $last) \
  }'
else
  # creat awk syntax for values
  awk_args="{printf("
    while [ "$1" != "" ]; do
      pf_s+="%s"
      pf_p+=',$'$1
      shift
      if [ "$1" != "" ]; then
        pf_s+=":"
      fi
    done
  awk_args+="\"$pf_s\n\"$pf_p)}"

fi

# use column so separete results
cat - | while read LINE ; do
  echo "${LINE}" | awk "$awk_args" | column -t -s ':'
done
