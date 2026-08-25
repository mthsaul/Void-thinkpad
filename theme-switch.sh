#!/bin/sh
IMG="$1"
[ -z "$IMG" ] && exit 1

swww img "$IMG" --transition-type wipe --transition-duration 1
wal -i "$IMG" -n -q -s -t -e --saturate 0.3

pkill waybar
nohup waybar -c "$HOME/.config/waybar/config-green" -s "$HOME/.config/waybar/style-green.css" >> /tmp/waybar-autostart.log 2>&1 </dev/null &
