#!/bin/bash

# Import color scheme
. "$HOME/.cache/wpgtk.color"

# Options
width="430"
height="30"

# Get monitor width so we can center the bar.
resolution="$(xrandr --nograb --current | awk '/\*/ {printf $1; exit}')"
monitor_width="${resolution/x*}"
offset="$((monitor_width - width))"
geometry="${width}x${height}+0+5"

indicator() {
  SPACES=$(bspc query -D)
  BUSY=$(bspc query -D -d .occupied)
  C=1

  for SPACE in $SPACES
  do
    CHAR="\uf111"
    case "$C" in
      "1")
        CHAR="\uf120"
        ;;
      "2")
        CHAR="\ufa9e"
        ;;
      "3")
        CHAR="\uf121"
        ;;
      "4")
        CHAR="\uf06c"
        ;;
      "5")
        CHAR="\ufb32"
        ;;
      "6")
        CHAR="\uf7ca"
        ;;
      "7")
        CHAR="\uf795"
        ;;
    esac
    if [[ $SPACE = $(bspc query -D -d) ]]; then
      echo -n "%{B${color5}}%{F${background}} $CHAR %{F-}%{B-}"
    elif [[ $BUSY =~ $SPACE ]]; then
      echo -n "%{A:bspc desktop -f '^$C':}%{F${color5}} $CHAR %{F-}%{A}"
    else
      echo -n "%{A:bspc desktop -f '^$C':} $CHAR %{A}"
    fi
    C=$(( C + 1 ))
  done
}

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
  esac

  echo "$layer"
}

stop() {
  pkill -P $$
  exit 0
}

trap 'stop' SIGINT SIGTERM

while true; do
  echo -e "%{F${background}}%{B${color6}}%{A:rofi-startmenu:} \uf303 %{A}%{B-}%{F-} $(indicator) %{F${background}}%{B${color3}} $(windowstate) $(windowlayer) %{F-}%{B-} $(windowflag) "
  sleep .2
done | \
  lemonbar -d -g $geometry -f "Hack Nerd Font" -F "${foreground}" -B "${background}" | \
  while read line; do eval "${line}"; done
