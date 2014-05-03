#!/bin/bash
#Scripts are licensed under Attribution-NonCommercial 4.0 International. Commercial permission must be saught by original author.
#Make sure script is run on debian wheezy
#Script created by Connall Lindsay, Assistance by Kirrus.
echo "Downloading other packages..."
wget http://www.terminal-control.com/pz-server/scripts/pz-server-start.sh
wget http://www.terminal-control.com/pz-server/scripts/pz-server-update.sh
wget http://www.terminal-control.com/pz-server/scripts/pz-server-backup.sh
echo "Successful switch user."
echo "Making steamcmd directory."
mkdir steamcmd
echo "Switching over directories."
cd /home/pz-server/steamcmd
echo "Starting steamcmd download."
wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
echo "Extracting steamcmd."
tar -xvzf steamcmd_linux.tar.gz

cd /home/pz-server/steamcmd
echo "Please enter your steam login details:"
echo "Username:"
read steamUsername
echo "Password (Text entered will not be visible:"
read -s steamPassword
echo "Running installation"
./steamcmd.sh +login $steamUsername $steamPassword "+app_update 108600 -beta iwillbackupmysave -betapassword iaccepttheconsequences" validate +exit
echo "Installation finished."

echo "Switching back to root..."
echo "NOTE: This file installed iwillbackupmysave branch of Project Zomboid."
echo "If this is an incorrect branch, then please head over to theindiestone"
echo "forums to get a new version. If one is not available PM Connall"