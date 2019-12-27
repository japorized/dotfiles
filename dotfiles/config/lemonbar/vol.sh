#!/bin/bash
# Dependencies:
# getRes (own), pulseaudio-ctl, mkb

. "$XDG_CONFIG_HOME/lemonbar/style.sh"

width="300"
height="50"
resolution=($(getRes))
monitor_width=${resolution[0]}
monitor_height=${resolution[1]}
offset_width=$(( monitor_width - width - 10 ))
offset_height=$(( monitor_height - height - 10 ))
geometry="${width}x${height}+${offset_width}+${offset_height}"

Muted() {
  pulseaudio-ctl full-status | cut -d " " -f2
}

Volume(){
  SIZE=10 START="" END="" SEP="" CHAR1="" CHAR2="%{F${background}}%{F-}" \
  mkb $(pulseaudio-ctl full-status | cut -d " " -f1)
}

while true; do
  if [[ $(Muted) == "yes" ]] ; then
echo -e "%{c}%{F${foreground}}%{B${background}}    %{F-}%{B-}" && sleep 1.5 && exit
  else
echo -e "%{l}%{F${foreground}}%{B${background}}    $(Volume) %{F-}%{B-}" && sleep 1.5 && exit
  fi
done | lemonbar -d -g $geometry -f "${iconfont}" -B "${background}"
