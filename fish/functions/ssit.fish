#!/usr/bin/env fish

# sleep 0.1 
# if it doesnt work, uncomment previous line; 
# scrot had a bug where it would sometimes fail without that line :/
function ssit --description "Grab a screenshot, uploat it to 0x0.st and copy link"
    notify-send "Grabbing..."
    set filename "/tmp/"(random)".png"
    scrot --silent --line mode=edge,width=5,color="#0adbdb" --select $filename --exec 'convert $f -bordercolor "#a0dbdb" -border 5 $f'
    curl -s -F file=@$filename -F expires=1 0x0.st | xsel -i -b
    rm $filename
end
