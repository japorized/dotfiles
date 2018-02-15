#!/bin/bash

# Options
width="320"
height="40"
font="DejaVu Sans-9"
ssid="nothing"

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
        CHAR="\uf269"
        ;;
      "3")
        CHAR="\uf121"
        ;;
      "4")
        CHAR="\uf085"
        ;;
      "5")
        CHAR="\uf04b"
        ;;
    esac
    C=$(( C + 1 ))
    if [[ $SPACE = $(bspc query -D -d) ]]; then
      echo -n "%{F#cd98cd}$CHAR%{F-}     "
    elif [[ $BUSY =~ $SPACE ]]; then
      echo -n "%{F#6498ce}$CHAR%{F-}     "
    else
      echo -n "$CHAR     "
    fi
    echo -n "${A}"
  done
}

while true; do
    echo -e "%{c}%{F#fafafa}%{B#333333}$(indicator)%{F-}%{B-}"
    sleep .5
done | lemonbar -d -g $geometry -f "$font" -f "FontAwesome" -B "#333333"
