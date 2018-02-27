#!/bin/bash

# Options
width="350"
height="40"
font="DejaVu Sans-9"
 
# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
monitor_height="${resolution#*x}"
offset_width="$((monitor_width / 2 - width / 2))"
offset_height="$((monitor_height - height - 10))"
geometry="${width}x${height}+${offset_width}+${offset_height}"
 
Scrot() {
    echo -n "Screenshot!"
    return
}
 
while true; do
    echo -e "%{c}%{F#fafafa}%{B#333333} \uf030  $(Scrot)"
    sleep 0.7
    exit
done | lemonbar -g $geometry -f "$font" -f "FontAwesome" -B "#333333"
