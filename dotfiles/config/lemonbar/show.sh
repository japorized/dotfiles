#!/bin/bash

# Import color scheme
. "$HOME/.cache/wpgtk.color"

# Options
width="400"
height="30"
ssid="---"
 
# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
monitor_height="${resolution#*x}"
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
done | lemonbar -d -g $geometry -f "Helvetica Neue-9" -f "Hack Nerd Font-10" -B "${background}" -F "${foreground}"
