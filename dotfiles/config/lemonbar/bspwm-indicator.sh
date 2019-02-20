#!/bin/bash

# Import color scheme
. "$HOME/.cache/wpgtk.color"

# Options
width="300"
height="30"

# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
offset="$((monitor_width - width))"
geometry="${width}x${height}+0+5"

indicator() {
  SPACES=$(bspc query -D)
  BUSY=$(bspc query -D -d .occupied)
  C=1

  for SPACE in $SPACES
  do
    CHAR="\uf111"
    case "$C" in
      "1")
        CHAR="\uf120"
        ;;
      "2")
        CHAR="\ufa9e"
        ;;
      "3")
        CHAR="\uf121"
        ;;
      "4")
        CHAR="\uf06c"
        ;;
      "5")
        CHAR="\ufb32"
        ;;
      "6")
        CHAR="\uf7ca"
        ;;
      "7")
        CHAR="\uf795"
        ;;
    esac
    if [[ $SPACE = $(bspc query -D -d) ]]; then
      echo -n "%{B${color5}}%{F${background}} $CHAR %{F-}%{B-}"
    elif [[ $BUSY =~ $SPACE ]]; then
      echo -n "%{A:bspc desktop -f '^$C':}%{F${color5}} $CHAR %{F-}%{A}"
    else
      echo -n "%{A:bspc desktop -f '^$C':} $CHAR %{A}"
    fi
    C=$(( C + 1 ))
  done
}

stop() {
  pkill -P $$
  exit 0
}

trap 'stop' SIGINT SIGTERM

while true; do
  echo -e "%{F${background}}%{B${color6}}%{A:rofi -show run:} \uf303 %{A}%{B-}%{F-} $(indicator)"
  sleep .2
done | \
  lemonbar -d -g $geometry -f "Hack Nerd Font" -F "${foreground}" -B "${background}" | \
  while read line; do eval "${line}"; done
