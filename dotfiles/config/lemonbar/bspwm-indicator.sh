#!/bin/bash

# Options
width="340"
height="40"

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
        CHAR="\uf06c"
        ;;
      "5")
        CHAR="\uf04b"
        ;;
      "6")
        CHAR="\uf11b"
        ;;
    esac
    if [[ $SPACE = $(bspc query -D -d) ]]; then
      echo -n "%{B#cd98cd}%{F#2D2D2D}   $CHAR   %{F-}%{B-}"
    elif [[ $BUSY =~ $SPACE ]]; then
      echo -n "%{A:bspc desktop -f '^$C':}%{F#cd98cd}   $CHAR   %{F-}%{A}"
    else
      echo -n "%{A:bspc desktop -f '^$C':}   $CHAR   %{A}"
    fi
    # echo -n "${A}"
    C=$(( C + 1 ))
  done
}

while true; do
    echo -e "%{c}%{F#D3D0C8}%{B#2D2D2D}$(indicator)%{F-}%{B-}"
    sleep .5
done | lemonbar -d -g $geometry -f "$font" -f "FontAwesome" -B "#2D2D2D" | while read line; do eval "${line}"; done
