#!/usr/bin/env bash

# Import wal-colors
. "$HOME/.cache/wal/colors.sh"

# Options
width="150"
height="40"
font="Helvetica Neue-9"

# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
# offset="$((monitor_width / 2 - width / 2))"
offset="$((monitor_width / 2 - width / 2))"
geometry="${width}x${height}+0+50"

getApp() {
  app=$(ps -e | grep $(xdotool getwindowpid $(xdotool getwindowfocus)) | grep -v grep | awk '{print $4}')
  if [ "$app" = "" ]; then
    app="desktop"
  fi
  echo -n $app
}

while true; do
  echo -e "%{c}%{F${foreground}}%{B${background}}$(getApp)%{F-}%{B-}"
  sleep 0.5
done | lemonbar -d -g $geometry -f "$font" -f "FontAwesome" -f "ipagothic-11" -B "${background}"
