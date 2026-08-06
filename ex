#!/usr/bin/env bash
#
# ############################################################################
# Project: scripts (none)
# File...: ex
# Created: Saturday, 2020/02/01 - 00:00:31
# Author.: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Thursday, 2026/08/06 - 01:23:26
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 1.0.0.74
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  >
# ############################################################################
# HISTORY:
#

# shellcheck disable=SC1090
source "$xSHELL_INIT"
use args colors
xr(){ xrequirements "$@"; }
xr mkdir pwd

ex(){
  if [ -f "$1" ] ; then
    [ -n "$dir" ] && [ ! -d "$dir" ] && mkdir -p "$dir"
    case "$1" in
      *.tar* )
        xr tar
        case "$1" in
          *.tar.bz2|*.tbz2) tar xjf "$1" -C "$dir" ;;
          *.tar.gz|*.tgz  ) tar xzf "$1" -C "$dir" ;;
          *.tar           ) tar xf "$1" -C "$dir"  ;;
        esac
        ;;
      *.zip) xr unzip; unzip "$1" -d "$dir"  ;;
      *.rar) xr unrar; unrar x "$1" "$dir" ;;
      *.7z ) xr 7z; 7z x "$1" -o"$dir"  ;;
      *.bz2) xr bunzip2; bunzip2 -dk "$1" --stdout > "$dir/$(basename "${1%.bz2}")" ;;
      *.gz ) xr gunzip; gunzip -c "$1" > "$dir/$(basename "${1%.gz}")"  ;;
      *.Z  ) xr uncompress; uncompress -c "$1" > "$dir/$(basename "${1%.Z}")" ;;
      *) echo -e "${YELLOW} File '$1' cannot be extracted via '$APP_NAME'${RESET}"; exit 2 ;;
    esac
  else
    echo -e "${BGRED}Error! file ${REVERSE}'$1'${RESET}${BGRED} not found.${RESET}"
    exit 1
  fi
}

xarg --id -e,--extract --var file+r --desc "extract compressed <file>"
xarg --id -d,--dir     --var dir+r  --desc "define output <dir> for extracted files"
xarg --header "'$APP_NAME' is a wrapper for ${GREEN}EX${RESET}tracting compressed files (tar, zip, rar, 7z, bz2, gz, Z)"

xrun --xrequire-one --xversionrc "$@"

[ -z $file ] && { file=$1;    }
[ -z $dir  ] && { dir=$(pwd); }

ex "$file"