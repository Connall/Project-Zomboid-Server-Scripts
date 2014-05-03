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

echo "=====WELCOME TO PROJECT ZOMBOID SERVER START SCRIPT====="
echo "=====Script Created by: Connall Lindsay====="
for session in $(screen -ls | grep -o '[0-9]\{4\}')
do
	screen -S "${session}" -X quit;
done

echo "Killing all screens..."
echo "Starting screen..."
screen -t "pz-server" bash -c 'cd /home/pz-server/Steam/steamapps/common/ProjectZomboid; ./projectzomboid-dedi-server.sh; read'
echo "Server started."