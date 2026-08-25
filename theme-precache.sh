#!/bin/sh
for img in "$HOME/Pictures/wallpapers"/*.jpg "$HOME/Pictures/wallpapers"/*.jpeg "$HOME/Pictures/wallpapers"/*.png "$HOME/Pictures/wallpapers"/*.webp; do
  [ -f "$img" ] || continue
  wal -i "$img" -n -q --saturate 0.3
done
notify-send "Precache" "Paletas generadas" 2>/dev/null
