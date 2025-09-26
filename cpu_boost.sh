#!/bin/sh
if [ -n "$1" ] && [ "$(whoami)" != "root" ]; then
	echo "Must run as root"
	exit 1
fi
case "${1:-}" in
    "" ) cat /sys/devices/system/cpu/cpufreq/boost ;;
    1 | on ) echo 1 > /sys/devices/system/cpu/cpufreq/boost ;;
    0 | off ) echo 0 > /sys/devices/system/cpu/cpufreq/boost ;;
    * ) echo "Don't undertant [$1], must be on|off or blank" ;;
esac
