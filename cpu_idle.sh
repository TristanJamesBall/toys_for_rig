#!/bin/sh


case "${1:-}" in
    "" ) cat /sys/devices/system/cpu/cpuidle/current_governor ;;
    avail* ) cat /sys/devices/system/cpu/cpuidle/available_governors ;;
    * ) 
        if [ "$(whoami)" != "root" ]; then
			echo "Must run as root"
			exit 1
		fi
 
		if grep -q $1 /sys/devices/system/cpu/cpuidle/available_governors ; then
            echo $1 >/sys/devices/system/cpu/cpuidle/current_governor 
        else
            echo "[$1] is not a valid choice, use 'avail' to show options"
        fi
        ;;
esac
