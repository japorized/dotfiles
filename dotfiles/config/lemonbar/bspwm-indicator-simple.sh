#!/bin/bash

# Import color scheme
. "$HOME/.cache/wpgtk.color"

# Options
width="30"
height="30"

# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
offset="$((monitor_width - width))"
geometry="${width}x${height}+${offset}+70"

indicator() {
  SPACES=$(bspc query -D)
  BUSY=$(bspc query -D -d .occupied)
  C=1

  for SPACE in $SPACES
  do
    CHAR="\uf111"
    case "$C" in
      "1")
        CHAR=""
        ;;
      "2")
        CHAR=""
        ;;
      "3")
        CHAR=""
        ;;
      "4")
        CHAR=""
        ;;
      "5")
        CHAR=""
        ;;
      "6")
        CHAR=""
        ;;
      "7")
        CHAR=""
        ;;
    esac
    if [[ $SPACE = $(bspc query -D -d) ]]; then
      echo -n "%{B${background}}%{F${foreground}}   $CHAR   %{F-}%{B-}"
    fi
    C=$(( C + 1 ))
  done
}

while true; do
    echo -e "%{c}%{F${foreground}}%{B${background}}$(indicator)%{F-}%{B-}"
    sleep .2
done | lemonbar -d -g $geometry -f "FontAwesome" -F "${foreground}" -B "${background}" | while read line; do eval "${line}"; done
