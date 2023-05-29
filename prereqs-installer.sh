
#!/bin/bash

# Install prerequisites
# Taken from mfmjos's fork of chasing_your_tail

# Install Kismet
wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key --quiet | gpg --dearmor | sudo tee /usr/share/keyrings/kismet-archive-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/kismet-archive-keyring.gpg] https://www.kismetwireless.net/repos/apt/release/bullseye bullseye main' | sudo tee /etc/apt/sources.list.d/kismet.list >/dev/null
sudo apt-get update
sudo apt-get install kismet

# Add your user to the kismet group
sudo usermod -aG kismet `whoami`

# Add interface capture sources to Kismet config file
kismetSiteConf="/etc/kismet/kismet_site.conf"
echo source=wlan0 | sudo tee -a $kismetSiteConf
echo source=wlan1 | sudo tee -a $kismetSiteConf
echo source=hci0 | sudo tee -a $kismetSiteConf

# Create logging directory
mkdir $HOME/kismet_logs

# Change default Kismet logging directory
echo log_prefix=$HOME/kismet_logs/ | sudo tee -a /etc/kismet/kismet_logging.conf

# Autostart the GUI, Kismet, and enable monitor mode at boot. I created a separate startup script to run cyt_gui.py and kismet (see startup.sh)
autostartFile="/etc/xdg/autostart/display.desktop"
bash
su
echo "[Desktop Entry]" | tee -a $autostartFile  
echo "Name=CYT_GUI" | tee -a $autostartFile
echo "NoDisplay=false" | tee -a $autostartFile  
echo "X-GNOME-Autostart-enabled=true" | tee -a $autostartFile  
echo "Exec=startup.sh" | tee -a $autostartFile

echo "Prereq installer complete. Please reboot now"
