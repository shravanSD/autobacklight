#!/usr/bin/env bash

## Author: Shravan Dwarka (shravan_dwarka@live.com)
## Date: 2019-08-24
## Version: 1.0
##
## SET BACKLIGHT TO ON @ 18:00 (PC Time)
## SET BACKLIGHT TO OFF @ 06 00 (PC Time)
## SET VALUE=1 for 50%; SET VALUE=100 for 100%.
## TIME_ON_min: The time in 24H with no ':' to set backlight ON to the minimum
## TIME_ON_max: The time in 24H with no ':' to set backlight ON to the maximum
## TIME_OFF: The time in 24H with no ':' to set backlight OFF

bash -n "$0"
set -e
set -o nounset

CURRENT_VALUE="$(cat /sys/class/leds/dell::kbd_backlight/brightness)"
CURRENT_TIME="$(date '+%H%M%S')"
TIME_ON_min=170000
TIME_ON_max=200000
TIME_OFF=60000
USER_TURNOFF_min="$(tail -n1 backlight.log | grep 18000 | awk '{print $5}' | sed 's/\.//g')"
USER_TURNOFF_max="$(tail -n1 backlight.log | grep 20000 | awk '{print $5}' | sed 's/\.//g')"
LOG_FILE=/var/log/backlight.log

if [ "$CURRENT_TIME" -gt "$TIME_OFF" ]; then
	if [ ! "$CURRENT_VALUE" -eq 0 ]; then
		echo 0 > /sys/class/leds/dell::kbd_backlight/brightness
		echo "$(date +%H%M%S)": Backlight set to 0. >> $LOG_FILE
	fi
elif [ "$CURRENT_TIME" -gt "$TIME_ON_min" ] && [ "$CURRENT_TIME" -lt "$TIME_ON_max" ]; then
	if [ ! "$CURRENT_VALUE" -eq 1 ] && [ "$USER_TURNOFF_min" -eq 1 ]; then
		echo 0 > /dev/null
	else
		echo 1 > /sys/class/leds/dell::kbd_backlight/brightness
		echo "$(date +%H%M%S)": Backlight set to 1. >> $LOG_FILE
	fi
elif [ "$CURRENT_TIME" -gt "$TIME_ON_max" ]; then
	if [ ! "$CURRENT_VALUE" -eq 100 ] && [ "$USER_TURNOFF_max" -eq 100 ]; then
                echo 0 > /dev/null
        else
		echo 100 > /sys/class/leds/dell::kbd_backlight/brightness
		echo "$(date +%H%M%S)": Backlight set to 100. >> $LOG_FILE
	fi
fi
