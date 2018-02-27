#!/bin/bash

# Options
width="320"
height="40"
font="DejaVu Sans-9"

# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
offset="$((monitor_width - width))"
geometry="${width}x${height}+${offset}+5"


Clock() {
    DATETIME=$(date "+%a %b %d, %H:%M:%S")

    echo -n "$DATETIME"
}

while true; do
    echo -e "%{c}%{F#fafafa}%{B#333333} \uf073  $(Clock)%{F-}%{B-}"
    sleep 0.1
done | lemonbar -d -g $geometry -f "$font" -f "FontAwesome" -B "#333333"
