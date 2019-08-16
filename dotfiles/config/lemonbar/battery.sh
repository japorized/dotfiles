#!/bin/bash

# Import color scheme
. "$HOME/.cache/wpgtk.color"

#Options
width="90"
height="30"
font="Helvetica Neue-9"

# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
offset="$((monitor_width - width))"
geometry="${width}x${height}+${offset}+40"

Battery() {
  ACPIBATT=$(acpi --battery)
  BATPERC=$(echo $ACPIBATT | cut -d, -f2 | tr -d "%")
  STATUS=$(acpi -a | cut -d" " -f3)
  if [[ "$STATUS" == "on-line" ]] ; then
    echo -ne "%{F${color14}}%{F-}  %{F${foreground}}$BATPERC % %{F-}"
  # elif [[ "$STATUS" == " Full" ]] ; then
  #   echo -ne "%{F${color5}}%{F-} %{F${foreground}}$BATPERC % %{F-}"
  elif [[ "$BATPERC" -lt 20 ]]; then
    echo -ne "%{F${color1}}%{F-} %{F${foreground}}$BATPERC % %{F-}"
  elif [[ "$BATPERC" -lt 35 ]]; then
    echo -ne "%{F${color9}}%{F-} %{F${foreground}}$BATPERC % %{F-}"
  elif [ "$BATPERC" -lt 50 ]; then
    echo -ne "$BATPERC %"
  elif [[ "$BATPERC" -lt 70 ]]; then
    echo -ne "$BATPERC %"
  else
    echo -ne "$BATPERC %"
  fi
}

while true; do
    echo -e "%{c}%{F${foreground}}%{B${background}} $(Battery) %{F-}%{B-}"
    sleep 30
done | lemonbar -d -g $geometry -f "$font" -f "FontAwesome" -B "${background}"
