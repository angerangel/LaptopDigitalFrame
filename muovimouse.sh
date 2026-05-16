#!/bin/bash

#error output
exec 2>> /home/max/temp.txt

#get time
ora=`date +"%H"`

#if we are between 7:00 and 22:00
if [ $ora -gt 7  -a  $ora -gt 22 ] ; then
   #this move randomly the mouse to turn off screensaver
   export DISPLAY=:0
   myx=${RANDOM:0:2}
   myy=${RANDOM:0:2}
   xdotool mousemove  $myx $myy
fi



