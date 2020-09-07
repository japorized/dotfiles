#!/bin/bash
# Dependencies:
# getRes (own), light, pulseaudio-ctl, iwconfig

. "$XDG_CONFIG_HOME/lemonbar/style.sh"

# Options
width="700"
height="30"
ssid="---"
wifiinterface="wlp5s0"
laninterface="enp3s0"
 
# Get monitor width so we can center the bar.
resolution=($(getRes))
monitor_width=${resolution[0]}
monitor_height=${resolution[1]}
offset_width="$((monitor_width / 2 - width / 2))"
offset_height="$((monitor_height - height - 5))"
geometry="${width}x${height}+${offset_width}+${offset_height}"

Curbrightness() {
  lvl=$(light -G | cut -d'.' -f1)
  echo -n "   $lvl %"
}
 
Curvolume() {
  info=$(pulseaudio-ctl full-status)
  vol=$(echo $info | cut -d " " -f1)
  mute=$(echo $info | cut -d " " -f2)
  if [[ $mute == "yes" ]]; then
    echo -n ""
  else
    echo -n "   $vol %"
  fi
  return
}

Network() {
  isWired=$(ip route list | grep default | grep ${laninterface})
  if [ -n "$isWired" ]; then
    echo -n "   Wired"
    return
  else
    ssid=$(iwconfig ${wifiinterface} | grep ESSID | cut -d: -f2 | tr -d "\"")
    # ip=$(ifconfig wlp3s0|grep 10|grep 'inet addr')
    # ip=$(echo $ip|cut -d " " -f 2 |awk '{gsub("addr:", "");print}')
    echo -n "   $ssid"
    return
  fi
}

Diskspace() {
  df -akh | grep "/dev/sda3" | tail -n 1 | awk '{print $5}' | tr -d '\n'
  return
}

Filespace() {
  df -akh | grep "/dev/sda4" | tail -n 1 | awk '{print $5}' | tr -d '\n'
  return
}

Memspace() {
  meminfo=$(free -m | grep Mem)
  totalMem=$(echo $meminfo | awk -F " " '{print $2}')
  freeMem=$(echo $meminfo | awk -F " " '{print $4}')
  percentUsed=$(echo "scale=1; $freeMem/$totalMem * 100" | bc)
  echo -n "$percentUsed% free"
  return
}

CoffeeUp() {
  caff=$(pidof caffeine-ng)
  if [[ $caff == '' ]]; then
    echo -n ""
    return
  else
    echo -n "  |   "
    return
  fi
}

DoNotDisturb() {
  if [[ -e "/tmp/donotdisturb.lock" ]]; then
    echo -n "  |   "
    return
  else
    echo -n ""
    return
  fi
}

TrackpadStatus() {
  trackpadStatus=$(cat $HOME/.cache/trackpadStatus)
  if [ "$trackpadStatus" == "off" ]; then
    echo -n "  |   x"
    return
  else
    echo -n ""
  fi
}

counter=0

while true; do
  echo -e "%{c}%{F${foreground}}%{B${background}} $(Curbrightness)      $(Curvolume)     |   $(Network)   |      $(Diskspace) full       $(Filespace) full       $(Memspace) $(CoffeeUp)   $(DoNotDisturb)$(TrackpadStatus)"
  sleep 1
  if [[ $counter -ge 5 ]]; then
    exit
  else
    counter=$(($counter + 1))  
  fi
done | lemonbar -d -g $geometry -f "${font}" -f "${iconfont}" -B "${background}"
