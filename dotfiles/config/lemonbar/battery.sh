#!/bin/bash
# Dependencies:
# getRes (own), acpi

. "$XDG_CONFIG_HOME/lemonbar/style.sh"

#Options
width="90"
height="30"

# Get monitor width so we can center the bar.
monitor_width=$(getRes -w)
offset="$((monitor_width - width - 10))"
geometry="${width}x${height}+${offset}+50"

Battery() {
  BATTPERC=$(acpi --battery | cut -d, -f2 | tr -d "%")
  STATUS=$(acpi -a | cut -d" " -f3)
  if [[ "$STATUS" == "on-line" ]] ; then
    echo -ne "%{F${color14}}%{F-}  %{F${foreground}}$BATTPERC % %{F-}"
  # elif [[ "$STATUS" == " Full" ]] ; then
  #   echo -ne "%{F${color5}}%{F-} %{F${foreground}}$BATTPERC % %{F-}"
  elif [[ "$BATTPERC" -lt 20 ]]; then
    echo -ne "%{F${color1}}%{F-} %{F${foreground}}$BATTPERC % %{F-}"
  elif [[ "$BATTPERC" -lt 35 ]]; then
    echo -ne "%{F${color9}}%{F-} %{F${foreground}}$BATTPERC % %{F-}"
  elif [ "$BATTPERC" -lt 50 ]; then
    echo -ne "$BATTPERC %"
  elif [[ "$BATTPERC" -lt 70 ]]; then
    echo -ne "$BATTPERC %"
  else
    echo -ne "$BATTPERC %"
  fi
}

while true; do
    echo -e "%{c}%{F${foreground}}%{B${background}} $(Battery) %{F-}%{B-}"
    sleep 30
  done | lemonbar -d -g $geometry -f "$font" -f "${iconfont}" -B "${background}"
