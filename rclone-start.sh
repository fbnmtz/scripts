#!/usr/bin/env bash
#
# ############################################################################
# Project: scripts (none)
# File...: rclone-start.sh
# Created: Thursday, 2026/07/30 - 12:22:17
# Author.: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Last Modified: Monday, 2026/08/03 - 15:36:58
# Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Version: 0.0.1.25
# ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
# Description: 
#  >
# ############################################################################
# HISTORY:
#

mounts=(cmp.arquivos: cmp.storage: linux:xsync apps.fgm: sync.fgm:)

start(){

    killall rclone

    sleep 5

    rclone gui --addr localhost:8080 --api-addr localhost:5572 --user admin --pass admin &

    sleep 5

    for remote in "${mounts[@]}"; do
        mkdir -p "$HOME/mnt/rclone/$remote"
        rclone bisync $remote "$HOME/mnt/rclone/$remote" --create-empty-src-dirs --compare size,modtime,checksum --slow-hash-sync-only --resilient -MvP --drive-skip-gdocs --fix-case --resync --dry-run
    done
}

mount(){
    for remote in "${mounts[@]}"; do
        mkdir -p "$HOME/mnt/rclone/$remote"
        rclone mount $remote "$HOME/mnt/rclone/$remote" --vfs-cache-mode full &
    done
}

stop(){
    killall rclone
}

if [ $# -eq 0 ]; then
    start
    exit 0
else
    case "$1" in
        start)
            start
            ;;
        stop)
            stop
            ;;
        mount)
            mount
            ;;
        restart)
            stop
            sleep 2
            start
            ;;
        *)
            echo "Usage: $0 {start|stop|mount|restart}"
            exit 1
    esac
fi