#!/bin/bash
. "$HOME/.cache/wpgtk.color"

width="300"
height="50"
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
monitor_height="${resolution#*x}"
offset_width="$(( monitor_width / 2 - width / 2 ))"
offset_height="$(( monitor_height / 2 + height ))"
geometry="${width}x${height}+${offset_width}+${offset_height}"

Status() {
  pulseaudio-ctl full-status | cut -d " " -f2
}

Volume(){
  SIZE=10 START="" END="" SEP="" CHAR1="" CHAR2="%{F${background}}%{F-}" \
  mkb $(pulseaudio-ctl full-status | cut -d " " -f1)
}

while true; do
  if [[ $(Status) == "yes" ]] ; then
echo -e "%{c}%{F${foreground}}%{B${background}}    %{F-}%{B-}" && sleep 1.5 && exit
  else
echo -e "%{l}%{F${foreground}}%{B${background}}    Volume: $(Volume) %{F-}%{B-}" && sleep 1.5 && exit
  fi
done | lemonbar -d -g $geometry -f "FontAwesome-18" -B "${background}"
