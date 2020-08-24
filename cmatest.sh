#!/bin/bash
#################################################################################
# Copyright 2020 Technexion Ltd.
#
# Author: Lance Yen <lance.yen@technexion.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#################################################################################

#for git test add new command
#global variable
keypress=0

#time delay function
timedelay()
{
	for i in $(seq 1 $1);
	do
		if read -t 0; then
			read -n 1 char
			keypress=1
			break

		else
			sleep 1
		fi 

	done
}
clear

while [ $keypress -eq 0 ]; do
	  NOW=$(date +"%Y-%m-%d %H:%M:%S")
	  UPTIME=$(uptime | awk -F ',' '{print $1}')

	  echo "========================================"
	  echo "Date: $NOW"
	  echo "========================================"
	  echo "system up time : $UPTIME"
	  echo "========================================"
	  echo "Dump messages :"
	  echo ""
	  dmesg | grep 'PFNs busy'
	  timedelay 600
done

echo "Script stopped by press key"

