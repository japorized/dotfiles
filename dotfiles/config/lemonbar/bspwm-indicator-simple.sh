#!/bin/bash

# Import color scheme
. "$HOME/.cache/wpgtk.color"

# Options
width="50"
height="40"

# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
offset="$((monitor_width - width))"
geometry="${width}x${height}+${offset}+100"

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
        CHAR="\uf0ac"
        ;;
      "3")
        CHAR="\uf121"
        ;;
      "4")
        CHAR="\uf06c"
        ;;
      "5")
        CHAR="\uf0b1"
        ;;
      "6")
        CHAR="\uf025"
        ;;
      "7")
        CHAR="\uf11b"
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
