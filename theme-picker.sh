#!/usr/bin/env bash
WALLPAPERS="$HOME/Pictures/wallpapers"
THUMBS="$HOME/.cache/wallpaper-thumbs"

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
