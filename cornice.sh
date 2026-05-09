#!/bin/bash

#this permit to interact with mouse by xdotool
xhost +

#this is to activate the script from crontab
eport DISPLAY=:0

#this creates a list of folder containing the pictures. 
#The example look for Immagini folder, you can change it:
find Immagini/* -maxdepth 1 -type d > lista

#this mix the order
shuf  lista > lista2

#this make the slideshow
cat lista2 | xargs -I{}  -n1 sh -c 'mypath="{}" ; mypath2=$(basename $mypath) ;   cvlc   --sub-filter=marq --marq-marquee="$mypath2" --marq-position=5  --marq-size=100 --no-disable-screensaver --play-and-exit  -f  "{}"/*'


