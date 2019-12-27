#!/bin/bash
# Dependencies:
# getRes (own), xbacklight

. "$XDG_CONFIG_HOME/lemonbar/style.sh"

width="400"
height="70"
resolution=($(getRes))
monitor_width=${resolution[0]}
monitor_height=${resolution[1]}
offset_width="$(( monitor_width - width - 10 ))"
offset_height="$(( monitor_height - height - 10 ))"
geometry="${width}x${height}+${offset_width}+${offset_height}"

KBD_BRIGHTNESS(){
    xbacklight -ctrl smc::kbd_backlight -get \
    |SIZE=9 START="" END="" SEP="" CHAR1="" CHAR2="%{F${background}}%{F-}" mkb
}

while true; do
  echo -e "%{c}%{F${foreground}}%{B${background}}  \uf11c $(KBD_BRIGHTNESS) %{F-}%{B-}" && sleep 1.5 && exit
done | lemonbar -d -g $geometry -f "${iconfont}" -B "${background}"
