# LaptopDigitalFrame
This is a guide on how to transform a laptop or a pc in a digital frame. The idea is to use VLC to make the slideshow, and use the webcam as presence sensor. 

## Script for the slideshow
The script **cornice.sh** create a slideshow, it reads a folder containig your photos; it's made for a folder containing an organized folder list like this:

- Immagini
  - Folder2020
    - Image1.jpg
    - Image2.jpg
  - Folder2021
    - Image1.jpg
    - Image2.jpg
   
put it in your home directory.

Now modify /etc/crontab to activate in the morning and deactivate in the night the slideshow (change user and path accordingly to you configuration):

    0  7 * * *  max  /home/max/cornice.sh
    0 22  * * *   max killall cornice.sh
    0 22  * * *   max killall sh
    1 22  * * *   max killall cvlc
    1 22  * * *   max killall vlc

## The presensce sensor
In order to reduce the use of the monitor when nobody is looking at it, we may use the laptop webcam as a presence sensor.

First of all install motion (https://motion-project.github.io/), every distribution has its way, for example:  `sudo apt get install motion`

Now activete motion and activate the start at boot:

    sudo systemctl start motion
    sudo systemctl enable motion

The script **muovimouse.sh** is to move the mouse in order to activate the screen, and turn off the screensaver, when a presence is near the laptop. 

Now modify the file **/etc/motion/motion.conf**, change the *on_event_start* line this way:

    on_event_start  /home/max/muovimouse.sh

this way on motion detection the mouse is moved and the screensaver stops.

