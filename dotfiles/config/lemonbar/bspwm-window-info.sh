#!/bin/bash
# Dependencies:
# getRes, bspwm

. "$XDG_CONFIG_HOME/lemonbar/style.sh"

# Options
width="150"
height="30"

# Get monitor width so we can center the bar.
resolution=($(getRes))
monitor_width=${resolution[0]}
monitor_height=${resolution[1]}
offset_x="$((monitor_width - width))"
offset_y="$((monitor_height - height - 5))"
geometry="${width}x${height}+${offset_x}+${offset_y}"

windowstate() {
  state=""
  states=(tiled pseudo_tiled floating fullscreen)
  for bstate in ${states[@]}; do
    statestr=$(bspc query -N -n focused.${bstate})
    if [ "$statestr" != '' ]; then
      state=${bstate}
      break
    fi
  done 
  case "$state" in
    tiled)
      state=""
      ;;
    pseudo_tiled)
      state=""
      ;;
    floating)
      state=""
      ;;
    fullscreen)
      state=""
      ;;
    *)
      state="-"
      ;;
  esac

  echo "$state"
}

windowflag() {
  flag=""
  locked_icon=""
  sticky_icon=""
  private_icon=""
  flags=(sticky locked private)
  for bflag in ${flags[@]}; do
    flagstr=$(bspc query -N -n focused.${bflag})
    if [ "$flagstr" != '' ]; then
      if [ "$flag" != '' ]; then
        case "$bflag" in
          sticky)
            flag="$flag $sticky_icon"
            ;;
          locked)
            flag="$flag $locked_icon"
            ;;
          private)
            flag="$flag $private_icon"
            ;;
        esac
      else
        case "$bflag" in
          sticky)
            flag=$sticky_icon
            ;;
          locked)
            flag=$locked_icon
            ;;
          private)
            flag=$private_icon
            ;;
        esac
      fi
    fi
  done

  echo "$flag"
}

windowlayer() {
  layer=""
  layers=(below normal above)
  for blayer in ${layers[@]}; do
    layerstr=$(bspc query -N -n focused.${blayer})
    if [ "$layerstr" != '' ]; then
      layer=${blayer}
      break
    fi
  done 
  case "$layer" in
    below)
      layer=""
      ;;
    normal)
      layer=""
      ;;
    above)
      layer=""
      ;;
    *)
      layer="-"
      ;;
  esac

  echo "$layer"
}

stop() {
  pkill -P $$
  exit 0
}

trap 'stop' SIGINT SIGTERM

while true; do
  echo -e "%{r} $(windowflag) %{F${background}}%{B${color3}} $(windowlayer) $(windowstate) %{F-}%{B-} "
  sleep .2
done | \
  lemonbar -d -g $geometry -f "${iconfont}" -F "${foreground}" -B "${background}" | \
  while read line; do eval "${line}"; done
