#!/bin/bash

# Options
width="320"
height="40"
font="Terminus-9"

# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
offset="$((monitor_width - width))"
geometry="${width}x${height}+${offset}+5"


Clock() {
    DATETIME=$(date "+%b %d, %H:%M:%S")
    DAY=$(date "+%a")
    case $DAY in
      "Sun")
        DAY="日"
        ;;
      "Mon")
        DAY="月"
        ;;
      "Tue")
        DAY="火"
        ;;
      "Wed")
        DAY="水"
        ;;
      "Thu")
        DAY="木"
        ;;
      "Fri")
        DAY="金"
        ;;
      "Sat")
        DAY="土"
        ;;
    esac

    echo -n "$DATETIME ($DAY)"
}

while true; do
    echo -e "%{c}%{F#D3D0C8}%{B#2D2D2D} \uf073  $(Clock)%{F-}%{B-}"
    sleep 0.1
done | lemonbar -d -g $geometry -f "$font" -f "FontAwesome" -f "ipagothic-11" -B "#2D2D2D"
