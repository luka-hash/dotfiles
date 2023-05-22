# Copyright (c) 2023 Luka Ivanovic
# This code is licensed under MIT licence (see LICENCE for details)

#!/usr/bin/env bash

intern=eDP
extern=HDMI-A-0

if xrandr | grep "$extern connected"; then 
  xrandr --output "$intern" --mode 1920x1080 --rate 60 --output "$extern" --primary --mode 1920x1080 --rate 75 --above "$intern"
  sleep 1 && nitrogen --set-zoom-fill --head=0 $(cat $HOME/.cache/wal/wal)
  sleep 1 && nitrogen --set-zoom-fill --head=1 $(cat $HOME/.cache/wal/wal)
fi
