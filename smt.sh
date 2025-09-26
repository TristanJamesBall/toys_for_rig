#!/bin/sh
if [ -n "$1" ] && [ "$(whoami)" != "root" ]; then
	echo "Must run as root"
	exit 1
fi
case "${1:-}" in
    "" ) cat /sys/devices/system/cpu/smt/control ;;
    on ) echo on > /sys/devices/system/cpu/smt/control ;;
    off ) echo off > /sys/devices/system/cpu/smt/control ;;
    * ) echo "Don't undertant [$1], must be on|off or blank" ;;
esac
