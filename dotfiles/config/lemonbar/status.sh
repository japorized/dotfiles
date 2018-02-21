#!/bin/bash

# Options
width="750"
height="40"
font="DejaVu Sans-9"
ssid="nothing"
 
# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
monitor_height="${resolution#*x}"
offset_width="$((monitor_width / 2 - width / 2))"
offset_height="$((monitor_height - height - 10))"
geometry="${width}x${height}+${offset_width}+${offset_height}"
 
Curvolume() {
  info=$(pulseaudio-ctl full-status)
  vol=$(echo $info | cut -d " " -f1)
  mute=$(echo $info | cut -d " " -f2)
  if [[ $mute == "yes" ]]; then
    echo -n "\uf026   muted"
  else
    echo -n "\uf028   $vol %"
  fi
  return
}

Wifi() {
    ssid=$(iwconfig wlp3s0 |grep ESSID| awk '{print $NF}'|cut -d "\"" -f 2)
    ip=$(ifconfig wlp3s0|grep 10|grep 'inet addr')
    ip=$(echo $ip|cut -d " " -f 2 |awk '{gsub("addr:", "");print}')
    echo -n "$ssid"
    return
}

Diskspace() {
  df -akh | grep "/dev/sda8" | awk '{print $5}' | tr -d '\n'
  return
}

Filespace() {
  df -akh | grep "/dev/sda3" | awk '{print $5}' | tr -d '\n'
  return
}

Memspace() {
  meminfo=$(free -m | grep Mem)
  totalMem=$(echo $meminfo | awk -F " " '{print $2}')
  usedMem=$(echo $meminfo | awk -F " " '{print $3}')
  percentUsed=$(echo "scale=1; $usedMem/$totalMem * 100" | bc)
  echo -n "$percentUsed% used"
  return
}
 
while true; do
  echo -e "%{c}%{F#fafafa}%{B#333333} $(Curvolume)   |      $(Wifi)   |   \uf013    $(Diskspace) full    \uf07b    $(Filespace) full   \uf2db   $(Memspace) "
    sleep 2
    exit
done | lemonbar -g $geometry -f "$font" -f "FontAwesome" -B "#333333"
