#!/bin/sh
PIDFILE=/tmp/wf-recorder.pid

if [ -f "$PIDFILE" ]; then
    PID=$(cat "$PIDFILE")
    kill -TERM $PID
    sleep 1
    wait $PID 2>/dev/null
    rm "$PIDFILE"
    notify-send "Recording stopped"
else
    mkdir -p $HOME/Pictures/Videos
    RECORDING_FILE=$HOME/Pictures/Videos/recording_$(date +%Y%m%d_%H%M%S).mp4
    wf-recorder -g "$(slurp)" -c libx264 -p yuv420p -f "$RECORDING_FILE" &
    echo $! > "$PIDFILE"
    notify-send "Recording started"
fi
