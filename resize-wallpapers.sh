#!/bin/sh
SRC="$HOME/Pictures/wallpapers"
DST="$HOME/Pictures/wallpapers-resized"
mkdir -p "$DST"

for img in "$SRC"/*.jpg "$SRC"/*.jpeg "$SRC"/*.png "$SRC"/*.webp; do
  [ -f "$img" ] || continue
  name=$(basename "$img")
  out="$DST/$name"
  [ -f "$out" ] && continue
  convert "$img" -resize 1920x1080\> "$out" 2>/dev/null
  echo "hecho: $name"
  sleep 3
done
echo "=== TERMINADO ==="
