#!/bin/bash

#Options
width="120"
height="40"
font="DejaVu Sans-9"
ssid="nothing"

# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
offset="$((monitor_width - width ))"
geometry="${width}x${height}+${offset}+50"


Battery() {
    BATPERC=$(acpi --battery | cut -d, -f2)
    echo -ne "" "$BATPERC"
}

while true; do
    echo -e "%{c}%{F#fafafa}%{B#333333} $(Battery) %{F-}%{B-}"
    sleep 0.1
done | lemonbar -d -g $geometry -f "$font" -f "FontAwesome" -B "#333333"
