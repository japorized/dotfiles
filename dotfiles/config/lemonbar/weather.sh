#!/bin/bash
# Dependencies:
# getRes (own), jq, curl

. "$XDG_CONFIG_HOME/lemonbar/style.sh"

# Options
width="400"
height="30"
ssid="---"
 
# Get monitor width so we can center the bar.
resolution=($(getRes))
monitor_width=${resolution[0]}
monitor_height=${resolution[1]}
offset_width="$((monitor_width / 2 - width / 2))"
offset_height="$((monitor_height - height - 5))"
geometry="${width}x${height}+${offset_width}+${offset_height}"

GetCurIP() {
  curl --silent https://ipinfo.io/ip
}

GetCityname() {
  curl --silent https://ipvigilante.com/$(GetCurIP) | jq '.data.city_name' | tr -d "\""
}

GetWeather() {
  IFS="@"
  result=($(curl -s "wttr.in/$(GetCityname)?format=%l%40%C%40%t%40%w%40%p"))
  unset IFS
  echo " ${result[0]}: ${result[1]}    ${result[2]}    ${result[3]}    ${result[4]}"
}

counter=0

while true; do
  echo -e "%{c}%{F${foreground}}%{B${background}} $(GetWeather) "
  sleep 1
  if [[ $counter -ge 5 ]]; then
    exit
  else
    counter=$(($counter + 1))  
  fi
done | lemonbar -d -g $geometry -f "${font}" -f "${iconfont}" -f "Noto Color Emoji-9" -B "${background}"
