#!/bin/bash

# run.sh
# Display a long command line before running it


export TIMEFORMAT=$'\n%3R Elapsed (%3U User + %3S System )'

BOLD="$( tput bold )"
NORM="$( tput sgr0 )"
SPACER='    '
{
    printf " %-25s${SPACER} \\ \n"   "$1" 
    printf " ${SPACER}%-25s \\ \n"   "${@:2:$(($#-2))}"
    printf " ${SPACER}%-25s \n \n"   "${@:$#}"
} | sed -r "s/([[:punct:]])/${BOLD}\\1${NORM}/g"
printf "${NORM}"

time "$@"
