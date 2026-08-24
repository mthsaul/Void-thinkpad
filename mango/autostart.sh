#!/bin/sh
export XCURSOR_THEME=Bibata-Modern-Turquoise
export XCURSOR_SIZE=24
export PATH="$HOME/.local/bin:$PATH"
if [ -z "${DBUS_SESSION_BUS_ADDRESS:-}" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
    mkdir -p "/run/user/$(id -u)"
    BUS_PATH=$(echo "$DBUS_SESSION_BUS_ADDRESS" | sed 's#^unix:path=##; s#,guid=.*##')
    ln -sf "$BUS_PATH" "/run/user/$(id -u)/bus"
fi
pulseaudio --start &
swaybg -i "$HOME/Pictures/miku/wallhaven-gwmyk7.jpg" -m fill &

# Mantiene disponible el proxy local para Codex en cada inicio de sesión.
if ! pgrep -x omniroute >/dev/null 2>&1; then
  nohup omniroute >> "$HOME/.omniroute.log" 2>&1 </dev/null &
fi

# waybar independiente de la terminal
nohup waybar \
  -c "$HOME/.config/waybar/config-green" \
  -s "$HOME/.config/waybar/style-green.css" \
  >> /tmp/waybar-autostart.log 2>&1 </dev/null &

mako &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
