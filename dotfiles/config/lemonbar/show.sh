#!/bin/bash
# Dependencies:
# getRes (own)

. "$XDG_CONFIG_HOME/lemonbar/style.sh"

# Options
width="400"
height="30"
ssid="---"
 
# Get monitor width so we can center the bar.
monitor_width=$(getRes -w)
offset_width="$((monitor_width / 2 - width / 2))"
offset_height="5"
geometry="${width}x${height}+${offset_width}+${offset_height}"

while true; do
  if [ -n "$2" ]; then
    echo -e "%{c}$2   $1"
  else
    echo -e "%{c}   $1"
  fi
  sleep 2
  exit 0
done | lemonbar -d -g $geometry -f "${font}" -f "${iconfont}" -B "${background}" -F "${foreground}"
