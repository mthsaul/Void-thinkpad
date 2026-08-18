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
omniroute > /tmp/omniroute.log 2>&1 &
swaybg -c '#20483c' &

# waybar con auto-reintento: si muere al arrancar, lo relanza hasta 5 veces
(
  sleep 2
  for i in 1 2 3 4 5; do
    if ! pgrep -x waybar > /dev/null; then
      waybar -c "$HOME/.config/waybar/config-green" -s "$HOME/.config/waybar/style-green.css" >> /tmp/waybar-autostart.log 2>&1 &
      sleep 3
    else
      break
    fi
  done
) &

mako &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
