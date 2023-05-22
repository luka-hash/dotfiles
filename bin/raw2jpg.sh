# Copyright (c) 2023 Luka Ivanovic
# This code is licensed under MIT licence (see LICENCE for details)

#!/usr/bin/evn bash

i=1

for img in *.CR2; do
  convert $img $i.jpg
  convert -rotate -90 $i.jpg $i.jpg
  ((i=i+1))
done
