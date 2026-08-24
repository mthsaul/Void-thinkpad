#!/bin/sh
# Instalador de Void-thinkpad dotfiles
# Requiere: Void Linux (o similar) + mango + waybar + rofi + alacritty

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
CONFIG="$HOME/.config"

echo "==> Instalando dotfiles desde $DOTFILES"

mkdir -p "$CONFIG"

backup_and_link() {
    src="$1"
    dest="$2"
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "  Respaldando $dest -> $dest.bak"
        mv "$dest" "$dest.bak"
    fi
    ln -sfn "$src" "$dest"
    echo "  Enlazado: $dest -> $src"
}

for dir in alacritty fastfetch mako mango rofi waybar; do
    backup_and_link "$DOTFILES/config/$dir" "$CONFIG/$dir"
done

backup_and_link "$DOTFILES/config/starship.toml" "$CONFIG/starship.toml"
backup_and_link "$DOTFILES/mango/autostart.sh" "$CONFIG/mango/autostart.sh"
backup_and_link "$DOTFILES/waybar" "$CONFIG/waybar-extra" 2>/dev/null || true

echo ""
echo "==> Dependencias necesarias (instala lo que falte):"
echo "  sudo xbps-install -S mango waybar rofi alacritty pywal swaybg mako starship fastfetch"
echo ""
echo "==> Listo. Cierra sesión y vuelve a entrar, o reinicia mango, para aplicar todo."
