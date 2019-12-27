#!/bin/bash
# Dependencies:
# getRes (own), light, mkb

. "$XDG_CONFIG_HOME/lemonbar/style.sh"

width="300"
height="50"
resolution=($(getRes))
monitor_width=${resolution[0]}
monitor_height=${resolution[1]}
offset_width="$(( monitor_width - width - 10 ))"
offset_height="$(( monitor_height - height - 10 ))"
geometry="${width}x${height}+${offset_width}+${offset_height}"

Brightness(){
    light -G \
    |SIZE=12 START="" END="" SEP="" CHAR1="" CHAR2="%{F${background}}%{F-}" mkb
}

while true; do
  echo -e "%{l}%{F${foreground}}%{B${background}}    $(Brightness) %{F-}%{B-}"
  sleep 1.5
  exit
done | lemonbar -d -g $geometry -f "${iconfont}" -B "${background}"
