#!/bin/bash
# Dependencies:
# getRes (own)

. "$XDG_CONFIG_HOME/lemonbar/style.sh"

# Options
width="180"
height="30"

# Get monitor width so we can center the bar.
monitor_width=$(getRes -w)
offset="$((monitor_width - width - 10))"
geometry="${width}x${height}+${offset}+10"

Clock() {
    DATETIME=$(date "+%b %d, %H:%M:%S")
    DAY=$(date "+%a")
    case $DAY in
      "Sun")
        DAY="日"
        ;;
      "Mon")
        DAY="月"
        ;;
      "Tue")
        DAY="火"
        ;;
      "Wed")
        DAY="水"
        ;;
      "Thu")
        DAY="木"
        ;;
      "Fri")
        DAY="金"
        ;;
      "Sat")
        DAY="土"
        ;;
    esac

    echo -n "$DATETIME ($DAY)"
}

while true; do
    echo -en "%{c} \uf073  $(Clock) "
    sleep 0.5
done | lemonbar -d -g $geometry -f "$font" -f "${iconfont}" -f "${jpfont}" -F "${foreground}" -B "${background}"
