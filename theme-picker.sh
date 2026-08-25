#!/usr/bin/env bash
WALLPAPERS="$HOME/Pictures/wallpapers"
THUMBS="$HOME/.cache/wallpaper-thumbs"

for img in "$WALLPAPERS"/*.jpg "$WALLPAPERS"/*.jpeg "$WALLPAPERS"/*.png "$WALLPAPERS"/*.webp; do
  [ -f "$img" ] || continue
  name=$(basename "$img")
  thumb="$THUMBS/$name.png"
  if [ ! -f "$thumb" ]; then
    convert "$img" -resize 300x300 "$thumb" 2>/dev/null
    wal -i "$img" -n -q -s -t -e --saturate 0.3 2>/dev/null
  fi
done

SELECTED=$(find "$WALLPAPERS" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | while read -r img; do
  name=$(basename "$img")
  thumb="$THUMBS/$name.png"
  [ -f "$thumb" ] || thumb="$img"
  printf '%s\x00icon\x1f%s\n' "$name" "$thumb"
done | rofi -dmenu -i -p "Elige tema" -show-icons -theme ~/.config/rofi/theme-wallpapers.rasi)

[ -z "$SELECTED" ] && exit 0

IMGPATH="$WALLPAPERS/$SELECTED"
[ -f "$IMGPATH" ] || exit 1

~/.local/bin/theme-switch.sh "$IMGPATH"
