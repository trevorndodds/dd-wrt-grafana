#!/bin/sh
date="$( date +%s )"
server="192.168.1.54"
port="2003"
google=`ping -c 10 www.google.com | tail -2`
packet=`echo "$google" |grep "packet loss" | cut -d "," -f 3 | cut -d " " -f 2| sed 's/.$//'`
google=`echo "$google" |grep "round-trip" | cut -d "=" -f 2 | cut -d "/" -f 1`
echo "ddwrt.perf.ping.google.packetloss.percent $packet $date" | nc $server $port ;
echo "ddwrt.perf.ping.google.latency $google $date" | nc $server $port ;
