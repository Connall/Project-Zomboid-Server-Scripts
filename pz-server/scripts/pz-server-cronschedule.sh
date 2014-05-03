#!/bin/bash
#Scripts are licensed under Attribution-NonCommercial 4.0 International. Commercial permission must be saught by original author.
#Make sure script is run on debian wheezy
#Script created by Connall Lindsay.
if grep -q "Linux 7" /etc/issue; then
	echo "Running debian wheezy, continuing"
else
	echo "Server OS is not Debian Wheezy. This script must be run on a Debian server, release Wheezy (7)." 1>&2
	exit 1
fi

#if [ -d /home/pz-server/Zomboid/Backup ]; 
#then
#	cd /home/pz-server/Zomboid
#	mkdir Backup
#	cp -r /home/pz-server/Zomboid/Multiplayer/servertest /home/pz-server/Zomboid/Backup
#else
#	cp -r /home/pz-server/Zomboid/Multiplayer/servertest /home/pz-server/Zomboid/Backup
#fi

path=/home/pz-server/Zomboid/Backup


# Action part
for fd in `ls -A $path`
do

if [ -d "$fd" ]
then
	((dir++))
fi
done

# Result
echo "Total number of directory in $path directory is "
echo $dir

