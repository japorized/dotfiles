#!/usr/bin/env bash

COUNTDOWN_PID_PATH=$XDG_CACHE_HOME/countdown.pid

duration="$(zenity --entry --text="Set duration")"
message="$(zenity --entry --text="Set message to show")"

function announce_completion() {
  notify-send "Countdown" "$message" &
  # alda -v 0 play --code "piano: a20 c b"
  ffplay -nodisp -vn -loglevel -8 -autoexit $XDG_DATA_HOME/sounds/ringside_gong_2.mp3
}

./countdown.ts "$duration" && announce_completion

kill $(cat "$COUNTDOWN_PID_PATH")
