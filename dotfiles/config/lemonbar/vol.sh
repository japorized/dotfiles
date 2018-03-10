#!/bin/bash
width="350"
height="70"
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
    pulseaudio-ctl |grep "Volume level" \
    |sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" \
    |gawk '{print $4}' \
    |SIZE=9 START="" END="" SEP="" CHAR1="" CHAR2=" " mkb
}

while true; do
  if [[ $(Status) == "yes" ]] ; then
echo -e "%{1}%{F#D3D0C8}%{B#2D2D2D}   \uf026 %{F-}%{B-}" && sleep 1.5 && exit
  else
echo -e "%{l}%{F#D3D0C8}%{B#2D2D2D}   \uf028 Volume: $(Volume) %{F-}%{B-}" && sleep 1.5 && exit
  fi
done | lemonbar -d -g $geometry -f "FontAwesome-18" -B "#2D2D2D"
