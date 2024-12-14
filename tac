#!/usr/bin/env bash
#
# ############################################################################
# Project: scripts (none)
# File...: tac
# Created: Saturday, 2024/12/14 - 15:42:06
# Author.: fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Saturday, 2024/12/14 - 16:11:08
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.0.1.10
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  >
# ############################################################################
# HISTORY:
#

# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~
# shellcheck disable=SC1090,SC2154
#   * SC1090: Can't follow non-constant source. Use a directive to specify location.
#       -> cant follow or source usage
#   * SC2154: var is referenced but not assigned.
#       -> variables created by or library system (don't worry)

# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~
source "$xSHELL_INIT"
use args

xrequirements tac:awk

_tac(){
  # It uses the awk command to read the file line by line and store each line in an array. 
  # Then, in the END block, it prints the lines of the array in reverse order.
  awk '{line[NR]=$0} END {for (i=NR; i>0; i--) print line[i]}' "$1"
}

if builtin tac; then
  tac "$@"
else
  _tac $1  
fi