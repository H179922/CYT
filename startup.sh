#!/bin/bash
python3 $HOME/cyt_gui.py & 
sleep 30 
$HOME/cyt/wlan1_to_mon.sh & 
sleep 60 
/usr/bin/kismet &
