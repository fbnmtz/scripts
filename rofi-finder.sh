#!/bin/dash
#
# ############################################################################
# Project: scripts (none)
# File...: rofi-finder.sh
# Created: unknow
# Author.: @manjaro dev team
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Sunday, 2023/07/09 - 00:03:00
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 1.0.0.32
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  > A fuzzy file-finder and opener based on rofi 
# Requires: rofi, xdg-utils, nerdfonts
# ############################################################################
# HISTORY:
#

files=/tmp/.file_list

update_list() {
	notify-send "rofi-finder" "Updating file list"

	find \( ! -regex '.*/\..*' \) -type d -not -path '*/\.*' 2> /dev/null | \
		sed -e 's/^\./:~/g' | \
		grep -v 'ECRYPTFS_FNEK_ENCRYPTED\|~/DATA/sys' | sort > /tmp/.file_list
		
	find \( ! -regex '.*/\..*' \) -not -type d 2> /dev/null | \
		sed -E -e '/png$|jpg$|tiff$|gif$|jpeg$|bmp$/ s/^\./:~/g' \
			-e '/mp3$|pcm$|wav$|aac$|ogg$|wma$/ s/^\./~/g' \
			-e '/wmv$|webm$|m4v$|mkv$|mov$|flv$|avi$|mp4$/ s/^\./辶:~/g' \
			-e 's/^\./:~/g' | \
		grep -v 'ECRYPTFS_FNEK_ENCRYPTED\|~/DATA/sys' | sort >> /tmp/.file_list
		
	find .config 2> /dev/null | \
		sed -E -e 's/^\./:~\/./g' | \
		grep -v 'ECRYPTFS_FNEK_ENCRYPTED\|~/DATA/sys' | sort >> /tmp/.file_list

	notify-send "rofi-finder" "Update done"
}

# main app
case "$1" in
    -u|--update) update_list; exit
esac

if [ -e $files ]; then
	# File list exist, use it
	input=$(cat $files | rofi -dmenu -p )
else
	# There is no file list, create it and show menu only after that
	update_list
	input=$(cat $files | rofi -dmenu -p )
fi
	case "$(echo $input | cut -d " " -f 1)" in
		a)
			exec $BROWSER https://wiki.archlinux.org/index.php/"$(echo $input | cut -d " " -f2-)" &> /dev/null &
			;;
		w)
			exec $BROWSER https://en.wikipedia.org/wiki/"$(echo $input | cut -d " " -f2-)" &> /dev/null &
			;;
		s)
			exec $BROWSER "https://startpage.com/do/search?query=$(echo $input | cut -d " " -f2-)&cat=web&pl=chrome&language=english" &> /dev/null &
			;;
		*)
			exec xdg-open "$(echo $input | sed 's/^....//g')" &> /dev/null &
			;;
	esac
