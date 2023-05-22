#!/usr/bin/env bash

# sleep 0.1 
# if it doesnt work, uncomment previous line; 
# scrot had a bug where it would sometimes fail without that line :/
notify-send "Grabbing..."
filename="/tmp/$(shuf -i 0-9999 -n1).png"
scrot --silent --line mode=edge,width=5,color="#0adbdb" --select $filename --exec 'convert $f -bordercolor "#a0dbdb" -border 5 $f'
curl -s -F file=@$filename -F expires=1 0x0.st | xsel -i -b
rm $filename
