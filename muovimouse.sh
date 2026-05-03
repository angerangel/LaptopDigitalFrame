#!/bin/bash

#error output
exec 2>> /home/max/temp.txt

#this move randomly the mouse
export DISPLAY=:0
myx=${RANDOM:0:2}
myy=${RANDOM:0:2}
xdotool mousemove  $myx $myy




