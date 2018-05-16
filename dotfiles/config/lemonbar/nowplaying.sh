#!/bin/bash

# Import wal-colors
. "$HOME/.cache/wal/colors.sh"

# Options
width="800"
height="40"
font="Helvetica Neue-9"
 
# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
monitor_height="${resolution#*x}"
offset_height="$((monitor_height - height - 10))"
geometry="${width}x${height}+0+${offset_height}"
 
mpd_status() {
  status=$(mpc | sed -n 2p | awk -F " " '{print $1}')
  output1=$(mpc | tail -1 | cut -f1 -d " " --complement )
  
  string=""
  
  # repeat
  repeattail=$(echo $output1 | sed 's/^.*repeat/repeat/')
  repeat=${repeattail% random*}
  if [[ $repeat == "repeat: on" ]]; then string="$string"r ; else string="$string-" ; fi
  
  # random
  randomtail=$(echo $output1 | sed 's/^.*random/random/')
  random=${randomtail% single*}
  if [[ $random == "random: on" ]]; then string="$string z"; else string="$string -" ; fi
  
  # single
  singletail=$(echo $output1 | sed 's/^.*single/single/')
  single=${singletail% consume*}
  if [[ $single == "single: on" ]]; then string="$string s" ; else string="$string -" ; fi
  
  # consume
  consume=$(echo $output1 | sed 's/^.*consume/consume/')
  if [[ $consume == 'consume: on' ]]; then string="$string c" ; else string="$string -" ; fi
  
  # crossfade
  crossfade=$(mpc crossfade)
  if [[ "$crossfade" == "crossfade: 0" ]]; then string="$string -" ; else string="$string x" ; fi

  # output
  if [[ $status == '[playing]' ]] ; then
    nowplaying=$(mpc current | cut -c -70)
    timer=$(mpc | sed -n 2p | awk -F " " '{print $3}')
    echo "$nowplaying   %{r}  [$string -] [ $timer ]   "
  elif [[ $status == '[paused]' ]] ; then
    nowplaying=$(mpc current | cut -c -60)
    echo "$nowplaying   %{r}  [$string -] [ paused ]   "
  else
    echo "mpd is not active"
  fi
}

spotify_status() {
  thispid=$(pidof spotify)
  if [[ -n $thispid ]]; then
    song=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep title -A 1 |tail -n 1 |cut -c 43- | sed 's/"//g' | cut -c -60)
    artist=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep albumArtist -A 2 | tail -n 1 | cut -c 26- | awk '{gsub("\"", "");print}')
    echo "$artist - $song"
  else
    echo "Spotify is not active"
  fi
}
 
while true; do
  if [[ $(spotify_status) != "Spotify is not active" ]] ; then
    echo -e "%{c}%{F${foreground}}%{F#98CD97}\uf1bc%{F-}    $(spotify_status)%{F-}"
  elif [[ $(mpd_status) != "mpd is not active" ]] ; then
    echo -e "%{l}%{F${foreground}}   \uf001    $(mpd_status)%{F-}"
  else
    echo -e "%{c}%{F${foreground}}No music players active%{F-}"
  fi
  sleep 1
done | lemonbar -d -g $geometry -f "FontAwesome" -f "$font" -f "ipagothic-9" -f "ipamincho-9" -B "${background}"
