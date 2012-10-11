#!/bin/sh

if [ $1 == c ]
	then
		read $2
		iwinfo wlan0 s|grep -A3 -B3 "Channel: ${2}"
elif [ $1 != c ]
	then
		iwinfo wlan0 s|grep -A4 -B2 "$1"
elif [ -z $1 ]
	then
		echo "Insert SSID [ENTER]"
		read ssid
		iwinfo wlan0 s|grep -A4 -B2 $ssid
fi

exit 0

