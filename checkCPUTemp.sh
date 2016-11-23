#!/bin/sh
date="$( date +%s )"
server="192.168.1.54"
port="2003"
cpuTemp=`awk "BEGIN {print $(cat /sys/class/i2c-dev/i2c-0/device/0-004c/hwmon/hwmon2/subsystem/hwmon1/temp1_input)/1000; exit}"`
echo "ddwrt.perf.temp.cpu.degrees $cpuTemp $date" | nc $server $port ;
wl0Temp=`awk "BEGIN {print $(cat /sys/class/i2c-dev/i2c-0/device/0-004c/hwmon/hwmon2/temp1_input)/1000; exit}"`
echo "ddwrt.perf.temp.wl0.degrees $wl0Temp $date" | nc $server $port ;
wl1Temp=`awk "BEGIN {print $(cat /sys/class/i2c-dev/i2c-0/device/0-004c/hwmon/hwmon2/temp2_input)/1000; exit}"`
echo "ddwrt.perf.temp.wl1.degrees $wl1Temp $date" | nc $server $port ;
