#!/bin/bash
# Dependencies:
# getRes (own), light, pulseaudio-ctl, iwconfig

. "$XDG_CONFIG_HOME/lemonbar/style.sh"

# Options
width="700"
height="30"
ssid="---"
wifiinterface="wlan0"
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
    ssid="$(iw dev wlan0 info | grep ssid | xargs | cut -d ' ' -f2-)"
    # ssid=$(iwconfig ${wifiinterface} | grep ESSID | cut -d: -f2 | tr -d "\"")
    # ip=$(ifconfig wlp3s0|grep 10|grep 'inet addr')
    # ip=$(echo $ip|cut -d " " -f 2 |awk '{gsub("addr:", "");print}')
    if [ -z "$ssid" ]; then
      ssid="---"
    fi

    echo -n "   $ssid"
    return
  fi
}

Diskspace() {
  df -akh | grep "/dev/nvme0n1p3" | tail -n 1 | awk '{print $5}' | tr -d '\n'
  return
}

Filespace() {
  df -akh | grep "/dev/sda1" | tail -n 1 | awk '{print $5}' | tr -d '\n'
  return
}

Memspace() {
  local totalMem=$(awk '/MemTotal/ { printf "%.3f", $2/1024/1024 }' /proc/meminfo)
  local freeMem=$(awk '/MemAvailable/ { printf "%.3f", $2/1024/1024 }' /proc/meminfo)
  percentUsed=$(echo "scale=1; $freeMem/$totalMem * 100" | bc)
  echo -n "$percentUsed% available"
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
