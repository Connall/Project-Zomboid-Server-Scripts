#!/bin/bash
#Make sure script is run on debian wheezy
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
echo "Adding unstable repository"
echo "deb http://ftp.debian.org/debian sid main" >> /etc/apt/sources.list
apt-get update
echo ""
echo "Installing packages"
apt-get -y -t sid install libc6 libc6-dev libc6-dbg linux-libc-dev gcc
apt-get -f install 
#if $? 
#then 
#	echo ">>>>> Problem detected! Contact kirrus on the forums. I'll now proceed to roll back."
#else
#	echo "glibc upgraded"
#fi
echo "Disabling unstable repository"
sed -i 's/deb http\:\/\/ftp.debian.org\/debian sid main/#deb http\:\/\/ftp.debian.org\/debian sid main/' /etc/apt/sources.list
apt-get update
