# ShadowGuard (fork)
Tool for using nearby wireless signals to help determine if you're being followed. 

Released under the MIT License https://opensource.org/licenses/MIT

## Chasing Your Tail
This is a fork of [Chasing Your Tail](https://github.com/azmatt/chasing_your_tail) by azmatt and [ShadowGuard](https://github.com/nobodynate/ShadowGuard) by nobodynate

- Built on RPi4 w/ Raspberry Pi OS 32 bit and using a JUN-ELECTRON 3.5" TFT LCD [drivers here](https://github.com/goodtft/LCD-show)
- I also made the dumb choice of digging up some ALFA AWUS306ACS from a box in the basement and had to go through quite a few hoops to get the drivers working. Lotta kernal mismatch issues. 
- Suffice to say you just need to add a line 'arm_64bit=0' to /boot/config.txt and make sure to 'sudo chmod 444 /boot/config.txt' 

- Shoutout to [morrownr](https://github.com/morrownr) for the drivers for my 8821AU (and an 88x2bu because I was really digging around in the basement)

I'd been trying to get this work last year and had a bunch of trouble, so if this is somehow useful for others I figure I'll see if I can make a mess of sharing it (first timer).  

I'm going about this in no particular order

SETUP:
ShadowGuard's setup script was great, I did have to modify it due to issues with adding the gpg key using apt-key. And also nothing I did got the display.desktop to autostart (probably just user error here -- workaround below (and the startup.sh script and just to clean up the display.desktop file)

chasing_your_tail.py
- I was getting an error initially
  - 'Traceback (most recent call last):
    File "/home/auser/ShadowGuard/cyt/chasing_your_tail.py", line 16, in <module>
    cyt_sub.mkdir(parents=True, exist_ok=True)

- Next up, I needed to modify (because I dont' know what I'm doing) /etc/lightdm/lightdm.conf to run my startup.sh script. I did this because nothing I was doing would launch cyt_gui.py using the display.desktop file. 
  - Uncomment session-setup-script=/your/file/path/here (I put my startup.sh in /usr/local/bin/)
  
What else, make the .py and .sh scripts executable (most of you probably know this)
- chmod +x /file/path/here

You might need to edit kismet.conf and also edit kismet_site.conf if you are modifying the wlan's you want to use (kismet_site.conf overwrites settings in kismet.conf so I'm guessing you can just change that one but honestly no clue) - if you want to avoid errors w/ your RPi internal wifi if you would like to have that on for whatever reason...I had to change/remove wlan0 from those configs
  
Oh, I also needed to install x-utils (I think honestly something else I did could've fixed this but can't hurt??)
  - 'sudo apt-get install x11-utils'

If you are in the future and x-term isn't what you need for your RPi and you don't know what its running for display use this command on the pi (not via SSH)
  'echo $DISPLAY'
  that should help you ask your personal robot assistants what to do

  
I'm probably leaving something out, but I basically made every mistake in the book so I think, so happy to try and help anyone else out. 
