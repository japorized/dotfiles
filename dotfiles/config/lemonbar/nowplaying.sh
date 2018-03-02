#!/bin/bash

# Options
width="800"
height="40"
font="Termite-9"
 
# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
monitor_height="${resolution#*x}"
offset_height="$((monitor_height - height - 10))"
geometry="${width}x${height}+0+${offset_height}"
 
mpd() {
  output=$(mpc)
  status=$(mpc | sed -n 2p | awk -F " " '{print $1}')
  if [[ $status == '[playing]' ]] ; then
    nowplaying=$(mpc | sed -n 1p | cut -c -60)
    timer=$(mpc | sed -n 2p | awk -F " " '{print $3}')
    echo "$nowplaying   %{r}[ $timer ]   "
  elif [[ $status == '[paused]' ]] ; then
    nowplaying=$(mpc | sed -n 1p | cut -c -60)
    echo "$nowplaying   %{r}[ paused ]   "
  else
    echo "mpd is not active"
  fi
}

spotify() {
  thispid=$(pidof spotify)
  if [[ -n $thispid ]]; then
    song=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep title -A 1 |tail -n 1 |cut -c 43-)
    artist=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep albumArtist -A 2 | tail -n 1 | cut -c 26- | awk '{gsub("\"", "");print}')
    echo "$artist - $song"
  else
    echo "Spotify is not active"
  fi
}
 
while true; do
  if [[ $(spotify) != "Spotify is not active" ]] ; then
    echo -e "%{c}%{F#fafafa}%{B#333333}\uf1bc    $(spotify)"
  elif [[ $(mpd) != "mpd is not active" ]] ; then
    echo -e "%{l}%{F#fafafa}%{B#333333}   \uf001    $(mpd)"
  fi
  sleep 1
done | lemonbar -g $geometry -f "$font" -f "FontAwesome" -f "$font" -B "#333333"
