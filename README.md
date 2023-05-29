# ShadowGuard (fork)
Tool for using nearby wireless signals to help determine if you're being followed. 

Released under the MIT License https://opensource.org/licenses/MIT

## Chasing Your Tail
This is a fork of [Chasing Your Tail](https://github.com/azmatt/chasing_your_tail) by azmatt and [ShadowGuard](https://github.com/nobodynate/ShadowGuard) by nobodynate

- Built on RPi4 w/ Raspberry Pi OS 32 bit and using a JUN-ELECTRON 3.5" TFT LCD [drivers here](https://github.com/goodtft/LCD-show)
- I also made the dumb choice of digging up some ALFA AWUS306ACS from a box in the basement and had to go through quite a few hoops to get the drivers working. Lotta kernal mismatch issues. Suffice to say you just need to add a line 'arm_64bit=0' to /boot/config.txt and make sure to 'sudo chmod 444 /boot/config.txt' 
Shoutout to [morrownr](https://github.com/morrownr) for the drivers for my 8821AU (and an 88x2bu because I was really digging around in the basement)

I'd been trying to get this work last year and had a bunch of trouble, so if this is somehow useful for others I figure I'll see if I can make a mess of sharing it (first timer).  

I'm going about this in no particular order

SETUP:
ShadowGuard's setup script was great, I did have to modify it due to issues with adding the gpg key using apt-key 

- chasing_your_tail.py
- I was getting an error initially
- 'Traceback (most recent call last):
  File "/home/auser/ShadowGuard/cyt/chasing_your_tail.py", line 16, in <module>
    cyt_sub.mkdir(parents=True, exist_ok=True)

- Next 
