#!/usr/bin/env bash

. "$HOME/.cache/wpgtk.color"

mpc_volume() {
  mpc volume | cut -d':' -f2 | tr -d ' '
}

mpd_status() {
  status="$(mpc | sed -n 2p | awk -F " " '{print $1}')"
  output1="$(mpc | tail -1 | cut -f1 -d " " --complement)"
  
  player_modes=""
  
  # repeat
  repeattail=$(echo $output1 | sed 's/^.*repeat/repeat/')
  repeat=${repeattail% random*}
  if [[ $repeat == "repeat: on" ]]; then
    player_modes="${player_modes}%{A1:mpc repeat:}r%{A}"
  else
    player_modes="${player_modes}%{A1:mpc repeat:}-%{A}"
  fi
  
  # random
  randomtail=$(echo $output1 | sed 's/^.*random/random/')
  random=${randomtail% single*}
  if [[ $random == "random: on" ]]; then
    player_modes="$player_modes %{A1:mpc random:}z%{A}"
  else
    player_modes="$player_modes %{A1:mpc random:}-%{A}"
  fi
  
  # single
  singletail=$(echo $output1 | sed 's/^.*single/single/')
  single=${singletail% consume*}
  if [[ $single == "single: on" ]]; then
    player_modes="$player_modes %{A1:mpc single:}s%{A}" 
  else
    player_modes="$player_modes %{A1:mpc single:}-%{A}"
  fi
  
  # consume
  consume=$(echo $output1 | sed 's/^.*consume/consume/')
  if [[ $consume == 'consume: on' ]]; then
    player_modes="$player_modes %{A1:mpc consume:}c%{A}" 
  else
    player_modes="$player_modes %{A1:mpc consume:}-%{A}"
  fi
  
  # crossfade
  crossfade=$(mpc crossfade)
  if [[ "$crossfade" == "crossfade: 0" ]]; then
    player_modes="$player_modes %{A1:mpc crossfade 5:}-%{A}" 
  else
    player_modes="$player_modes %{A1:mpc crossfade 0:}x%{A}"
  fi

  # output
  if [[ $status == '[playing]' ]] ; then
    nowplaying=$(mpc current | cut -c -60)
    timer=$(mpc | sed -n 2p | awk -F " " '{print $3}')
    echo "%{A1:mpc toggle:}%{F${color6}}♪%{F-}%{A} $nowplaying   %{r} [Vol: $(mpc_volume)] [$player_modes] [ $timer ]  "
  elif [[ $status == '[paused]' ]] ; then
    nowplaying=$(mpc current | cut -c -60)
    echo "%{A1:mpc toggle:}%{F${color3}}♪%{F-}%{A} $nowplaying   %{r} [Vol: $(mpc_volume)] [$player_modes] [ paused ]  "
  else
    echo "%{A1:systemctl --user restart mpd:}%{F${color1}}♪%{F-}%{A} mpd is offline"
  fi
}

mpd_status 2>/dev/null
