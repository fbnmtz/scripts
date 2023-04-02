#!/usr/bin/env bash
#
# ############################################################################
# Project: scripts (none)
# File...: aw
# Created: Thursday, 2020/09/22 - 12:58:16
# Author.: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Sunday, 2023/04/02 - 15:04:59
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.1.3.5
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  > wrapper for awk command
# ############################################################################
# HISTORY:
#

if [[ "$@" =~ "-" ]];then
  # notify-send "awk" "$1 has (-)"
  fst=$(echo $1 | cut -d '-' -f1)
  lst=$(echo $1 | cut -d '-' -f2)
  awk_args=' BEGIN { first = '$fst'; last = '$lst' } { for (i = first; i < last; i++) { printf("%10s ", $i) } printf("%10s", $last)}'
else
  # notify-send "awk" "single"

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

cat - | while read LINE
do
  echo "${LINE}" | awk "$awk_args" | column -t -s ':'
done
