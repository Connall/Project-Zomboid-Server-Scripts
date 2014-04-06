#!/bin/bash
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
echo "Installing Java"
apt-get -y install default-jdk
echo "Java Installed."
echo "Installing screen."
apt-get -y install screen
echo "screen installed."
echo "Checking for steam user..."

if id pz-server > /dev/null 2>&1
then
	echo "pz-server User Exists."
else
	echo "pz-server User doesn't exist. Creating..."
	adduser pz-server
fi


echo "Switching to pz-server user please wait...."
su - pz-server -c 'wget http://192.223.24.135/pz-server/scripts/pz-server-part2.sh;bash pz-server-part2.sh;'

echo "Getting glibc libraries."
wget http://kirrus.co.uk/stuff/pz/wheezy-glibc-sid.sh
echo "Running installation."
bash wheezy-glibc-sid.sh

echo "=====SERVER INSTALLED====="
echo "Check console for any errors that may have occured."