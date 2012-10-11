#!/bin/sh

local if_name=$(cat /proc/net/dev | sed -n -e 's/:.*//' -e 's/[ /t]*//' -e '/^wlan[0-9]$/p')

if [ $1 == ${if_name} ]
	then
		if [ $2 == c ]                                                 
			then                                                   
				iwinfo ${if_name} s|grep -A3 -B3 "Channel: ${3}"
		elif [ $2 != c ]                                    
			then                                        
				iwinfo ${if_name} s|grep -A4 -B2 "$2"
		elif [ -z $2 ]                                       
			then                                         
				echo "Insert SSID [ENTER]"           
				read ssid                            
				iwinfo ${if_name} s|grep -A4 -B2 $ssid
		fi
	else
		echo "Your wifi interface: '${if_name}'"
		echo "Insert interface name [ENTER]"
		read if_sel

		if [ $1 == c ]
			then
				iwinfo ${if_sel} s|grep -A3 -B3 "Channel: ${2}"
		elif [ $1 != c ]
			then
				iwinfo ${if_sel} s|grep -A4 -B2 "$1"
		elif [ -z $1 ]
			then
				echo "Insert SSID [ENTER]"
				read ssid
				iwinfo ${if_sel} s|grep -A4 -B2 $ssid
		fi
fi

exit 0

