<!--
 ############################################################################
 Project: scripts (none)
 File...: readme.md
 Created: Friday, 2023/03/31 - 04:54:21
 Author.: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Last Modified: Sunday, 2023/08/27 - 05:49:22
 Modified By..: @fbnmtz, (fabiano.matoz@gmail.com)
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Version: 0.0.1.83
 ~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~·~·~·~·~·~·~·~~·~·~·~·~·~~·~·~·~·~·~·~·~
 Description: 
  >
 ############################################################################
 HISTORY:
-->

<p align="center">
    <a href="https://www.codefactor.io/repository/github/fbnmtz/scripts/">
        <img src="https://www.codefactor.io/repository/github/fbnmtz/scripts/badge">
    </a>
    <a href="https://github.com/fbnmtz/shell/issues">
        <img src="https://img.shields.io/github/issues/fbnmtz/shell.svg">
    </a>
    <a href="https://img.shields.io/github/forks/fbnmtz/shell.svg">
        <img src="https://img.shields.io/github/forks/fbnmtz/shell.svg">
    </a>
    <a href="https://github.com/fbnmtz/shell/stargazers">
        <img src="https://img.shields.io/github/stars/fbnmtz/shell.svg">
    </a>
    <a href="https://github.com/fbnmtz/shell/graphs/contributors">
      <img alt="GitHub Contributors" src="https://img.shields.io/github/contributors/fbnmtz/shell" />
    </a>
    </br>
    <a href="https://repology.org/metapackage/shell/versions">
        <img src="https://repology.org/badge/tiny-repos/shell.svg">
    </a>
    <a href="https://gitHub.com/fbnmtz/scripts/releases/">
        <img src="https://img.shields.io/github/release/fbnmtz/scripts.svg">
    </a>
    <!-- <a href="#">
        <img src="https://img.shields.io/github/downloads/fbnmtz/scripts/total">
    </a> -->
</p>

<p align="center">
    </br></br></br>this is a simple collection of scripts.</br></br></br>
</p>

## Index

- [Index](#index)
- [Install](#install)
- [`aw`](#aw)
- [`cmx`](#cmx)
- [`dmount`](#dmount)
- [`dumount`](#dumount)
- [`gclone`](#gclone)
- [`getMail`](#getmail)
- [`mdate`](#mdate)
- [`mdisk`](#mdisk)
- [`mpdctl`](#mpdctl)
- [`mpvtube`](#mpvtube)
- [`ocr`](#ocr)
- [`popcorn`](#popcorn)
- [`quteprofiles`](#quteprofiles)
- [`xclip-cmd`](#xclip-cmd)
- [`xman`](#xman)
- [`ytdl`](#ytdl)
- [`ytinfo`](#ytinfo)

---

## Install

Install `scripts collection` to your system

```bash
curl -sSL https://raw.githubusercontent.com/fbnmtz/scripts/master/install | bash 
```

---

## `aw`
```
awk wrapper to simplify usage
```

## `cmx`
```
shortcut to add 'x' permission to a file
```
## `dmount`
```
use 'dmenu' to mount an avaiable disk/partition
```
## `dumount`
```
use 'dmenu' to umount an avaiable disk/partition
```

## `gclone`
```
clone git repository to a default destination and open it on ranger
```

## `getMail`
```
save all your email addresses. Select one and copy to clipboard.
```

<details close="true">

```bash
getMail -h
 
usage:
  getMail [-m] [-n <email>] [-e {editor}] [-h] [-v]

-> Available Options:
   -m,  --menu          select a email with a dmenu
   -n,  --new <email>   save new email
   -e,  --edit {editor} edit email list
   -h,  --help          show this help
   -v,  --version       print version and exit

v0.0.3 - writen by fbnmtz 2023

```
</details>

## `mdate`
```
some date functions
```
<details close="true">
```
mdate -h

helper to get date in many formats

usage:
  mdate [OPTIONS]

-> Date Options:
   -d,  --day             current day (number)
   -m,  --month           current month (number)
   -y,  --year            current year (number)
   -Y,  --year2           current year (two digits)
   -D,  --date            current date (full)

-> Time Options:
   -H,  --hour            current hour (number)
   -M,  --minutes         current minutes (number)
   -s,  --seconds         current seconds (number)
   -t,  --time            current time (H M S)

-> General Options:
   -u,  --us              full date in US format
   -b,  --br              full date in BR format
   -r,  --header          date/time for header
   -R,  --header-en       date/time for header (us format)
   -w,  --weekday         current weekday (name)
   -W,  --weekday-en      current weekday (name) (us format)
   -f,  --for-filename    full date formated for filename

-> Information Options:
   -h,  --help            show this help
   -v,  --version         print version and exit

v0.3.4-rc234 - writen by @fbnmtz 2020

```
</details>


## `mdisk`
```
tool to verify, make mbr backups and mount/unmount disks
```
## `mpdctl`
```
script to control MPD music server
```
<details close="true">

```bash
mpdctl -h

usage:
  mpdctl [OPTIONS]

-> Music Options:
   -p,  --play            play music of current playlist
   -N,  --next            next music
   -P,  --prev            previous music
   -t,  --toggle          toggle music
   -A,  --all             play all music on database
   -c,  --current         show current music
   -l,  --list-play       select and play music
   -p,  --playlist        playlists functions
   -s,  --status          music status
   -w,  --watch           watch music status

-> Server Options:
   -r,  --run             start MPD server
   -S,  --stats           stats of MPD server
   -q,  --quit            stop MPD server
   -u,  --update          update MPD database

-> Information Options:
   -h,  --help            show this help
   -v,  --version         print version and exit

v1.0.9-rc134 - writen by @fbnmtz 2023

```
</details>

## `mpvtube`
```
Manage and watch youtube videos with ROFI and MPV
```
## `ocr`
```
uses 'maim' and 'tesseract' to get a text with 'ocr'
```

## `popcorn`
```
Search torrents and watch on mpv
```
## `quteprofiles`
```
profile manager to user with qutebrowser
```

## `xclip-cmd`
```
xclip wrapper with some features:
* copy automaticly to buffers 'primary', 'secondary' and 'clipboard'.
* save a history off clipboard usage.

```

## `xman`
```
show the man of selected binary to in a .ps format
```

## `ytdl`
```
download a video/audio from a youtube url
```

## `ytinfo`
```
get info about videos/channels from YouTube.
```

[Go Back](#index)

---

Contributions and suggestions are welcome! &lt;3

Made with ❤️ and shellscript.
