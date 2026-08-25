#!/bin/sh
for img in "$HOME/Pictures/wallpapers"/*.jpg "$HOME/Pictures/wallpapers"/*.jpeg "$HOME/Pictures/wallpapers"/*.png "$HOME/Pictures/wallpapers"/*.webp; do
  [ -f "$img" ] || continue
  wal -i "$img" -n -q -s -t -e --saturate 0.3
done
echo "=== TERMINADO ==="
