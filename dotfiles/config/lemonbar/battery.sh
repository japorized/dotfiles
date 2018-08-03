#!/bin/bash

# Import wal-colors
. "$HOME/.cache/wal/colors.sh"

#Options
width="120"
height="40"
font="Helvetica Neue-9"

# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
offset="$((monitor_width - width))"
geometry="${width}x${height}+${offset}+50"

Battery() {
  ACPIBATT=$(acpi --battery)
  BATPERC=$(echo $ACPIBATT | cut -d, -f2 | tr -d "%")
  STATUS=$(echo $ACPIBATT | cut -d: -f2 | cut -d, -f1)
  if [[ "$STATUS" == " Charging" ]] ; then
    echo -ne "%{F${color4}}\uf0e7%{F-}  %{F${foreground}}$BATPERC % %{F-}"
  elif [[ "$STATUS" == " Full" ]] ; then
    echo -ne "%{F${color4}}%{F-} %{F${foreground}}$BATPERC % %{F-}"
  elif [[ "$BATPERC" -lt 20 ]]; then
    echo -ne "%{F#F47678}%{F-} %{F${foreground}}$BATPERC % %{F-}"
  elif [[ "$BATPERC" -lt 35 ]]; then
    echo -ne "%{F#E2B552}%{F-} %{F${foreground}}$BATPERC % %{F-}"
  else
    echo -ne " $BATPERC %"
  fi
}

while true; do
    echo -e "%{c}%{F${foreground}}%{B${background}} $(Battery) %{F-}%{B-}"
    sleep 1
done | lemonbar -d -g $geometry -f "$font" -f "FontAwesome" -B "${background}"
