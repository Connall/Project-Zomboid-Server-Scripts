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

echo "=====WELCOME TO PROJECT ZOMBOID SERVER BACKUP SCRIPT====="
echo "=====Script Created by: Connall Lindsay====="
echo "Press Enter to continue."
read