#!/bin/sh


case "${1:-}" in
    "" ) cat /sys/devices/system/cpu/cpufreq/policy0/scaling_governor ;;
    avail* ) cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_governors ;;
    * ) 
        if [ "$(whoami)" != "root" ]; then
            echo "Must run as root"
            exit 1
        fi
        
        if grep -q $1 /sys/devices/system/cpu/cpufreq/policy0/scaling_available_governors ; then
            echo $1 | tee /sys/devices/system/cpu/cpufreq/policy*/scaling_governor >/dev/null
        else
            echo "[$1] is not a valid choice, use 'avail' to show options"
        fi
        ;;
esac
