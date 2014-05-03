#!/bin/bash
#Scripts are licensed under Attribution-NonCommercial 4.0 International. Commercial permission must be saught by original author.
#Make sure script is run on debian wheezy
#Script created by Connall Lindsay, Assistance by Kirrus
if grep -q "Linux 7" /etc/issue; then
	echo "Running debian wheezy, continuing"
else
	echo "Server OS is not Debian Wheezy. This script must be run on a Debian server, release Wheezy (7)." 1>&2
	exit 1
fi

# Make sure only root can run our script

echo "=====WELCOME TO PROJECT ZOMBOID SERVER UPDATE SCRIPT====="
echo "=====Script Created by: Connall Lindsay====="
echo "NOTE: This file is set to install the beta branch iwillbackupmysave."
echo "If this is not the current branch, or this is incorrect then this file is out of date."
echo "Head to the indiestone forum if this is the case and PM Connall if a newer version is not available."
echo "Press Enter to start."
read
echo "Starting update..."
cd /home/pz-server/steamcmd
echo "Please enter your steam login details:"
echo "Username:"
read steamUsername
echo "Password (Text is hidden when typing.):"
read -s steamPassword
echo "Running update..."
./steamcmd.sh +login $steamUsername $steamPassword "+app_update 108600 -beta iwillbackupmysave -betapassword iaccepttheconsequences" validate +exit
echo $steamBranch
echo "Update Complete. Check console for any errors that may have occured."