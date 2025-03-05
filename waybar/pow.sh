#!/bin/bash

BATTERY_PATH="/sys/class/power_supply/macsmc-battery/power_now"

cat $BATTERY_PATH | awk '{printf "%.1f\n",(-1 * $1) / 1000000}'


