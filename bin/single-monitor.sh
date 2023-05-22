# Copyright (c) 2023 Luka Ivanovic
# This code is licensed under MIT licence (see LICENCE for details)

#!/usr/bin/env bash

intern=eDP
extern=HDMI-A-0

if xrandr | grep "$extern disconnected"; then 
  xrandr --output "$extern" --off --output "$intern" --primary --mode 1920x1080 --rate 60
  sleep 1 && nitrogen --set-zoom-fill $(cat $HOME/.cache/wal/wal)
else
  xrandr --output "$intern" --off --output "$extern" --primary --mode 1920x1080 --rate 75
  sleep 1 && nitrogen --set-zoom-fill $(cat $HOME/.cache/wal/wal)
fi



# xrandr --output "$intern" --primary --auto --output "$extern" --right-of "$intern" --auto

# xrandr --output "$intern" --mode 1920x1080 --rate 60 --output "$extern" --primary --mode 1920x1080 --rate 75 --above "$intern"
