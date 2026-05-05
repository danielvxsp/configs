#!/bin/bash
xrdb -merge ~/.Xresources

wal -R -a "80" -t -n && xwallpaper --zoom "$(cat ~/.cache/wal/wal)"
#wal -R -a "80" -t -n && xwallpaper --clear 
razer-cli -a
slstatus &
fastcompmgr -o 0.4 -r 12 -c -C &


exec dwm

