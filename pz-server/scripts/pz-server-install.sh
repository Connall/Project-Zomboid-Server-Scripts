#!/bin/bash
#Scripts are licensed under Attribution-NonCommercial 4.0 International. Commercial permission must be saught by original author.
#Make sure script is run on debian wheezy
#Script Created by Connall Lindsay, Assistance by Kirrus
if grep -q "Linux 7" /etc/issue; then
	echo "Running debian wheezy, continuing"
else
	echo "Server OS is not Debian Wheezy. This script must be run on a Debian server, release Wheezy (7)." 1>&2
	exit 1
fi

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "=====WELCOME TO PROJECT ZOMBOID SERVER INSTALL SCRIPT====="
echo "=====Script Created by: Connall Lindsay====="
echo "Press Enter to start."
read
echo "Checking Java pacakge."

if hash default-jdk 2>/dev/null;
then
	echo "Java is already installed."
else
	echo "Java is not installed. Installing..."
	apt-get -y install default-jdk
	echo "Java installed."
fi
echo "Checking screen package."

if hash screen 2>/dev/null;
then
	echo "Screen is already installed."
else
	echo "Screen is not installed. Installing..."
	apt-get -y install screen
fi
echo "Checking for pz-server user..."

if id pz-server > /dev/null 2>&1
then
	echo "pz-server User Exists."
else
	echo "pz-server User doesn't exist. Creating..."
	adduser pz-server
fi


echo "Switching to pz-server user please wait...."
su - pz-server -c 'wget https://raw.githubusercontent.com/Connall/Project-Zomboid-Server-Scripts/master/pz-server/scripts/pz-server-part2.sh;bash pz-server-part2.sh;'

echo "Checking server architecture..."
if (uname -m | grep -q 'x86_64'); then
	echo "Adjusting to 64 bit architecture..."
	dpkg --add-architecture i386
	apt-get update
	apt-get install lib32gcc1
fi

echo "Getting glibc libraries."
wget https://raw.githubusercontent.com/Connall/Project-Zomboid-Server-Scripts/master/pz-server/scripts/wheezy-glibc-sid.sh
echo "Running installation."
bash wheezy-glibc-sid.sh
rm wheezy-glibc-sid.sh

echo "=====SERVER INSTALLED====="
echo "Check console for any errors that may have occured."