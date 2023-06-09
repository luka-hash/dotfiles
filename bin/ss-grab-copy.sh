# Copyright (c) 2023 Luka Ivanovic
# This code is licensed under MIT licence (see LICENCE for details)

#!/bin/bash

tmp="$HOME/Pictures/$(date +%F_%T).png"

# sleeping cause scrot sometimes fails to with with select flag when called from bash script...
sleep 0.1
(notify-send "Grabing..." && scrot --line mode=edge,width=5,color="#0adbdb" --select - | convert - -bordercolor "#a0dbdb" -border 5 $tmp && xclip -selection clipboard -target image/png <$tmp && notify-send "Copied to clipboard!") || notify-send "Failed..."

#sleep 0.1; (notify-send "Grabing..." && scrot --line mode=edge,width=5,color="#0adbdb" --select $tmp && convert -bordercolor "#a0dbdb" -border 5 $tmp $tmp && xclip -selection clipboard -target image/png <$tmp && notify-send "Copied to clipboard!") || notify-send "Failed..."

