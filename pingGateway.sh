#!/bin/sh
date="$( date +%s )"
server="192.168.1.54"
port="2003"
pingResult=`ping -c 10 24.212.129.193 | tail -2`
packet=`echo "$pingResult" |grep "packet loss" | cut -d "," -f 3 | cut -d " " -f 2| sed 's/.$//'`
gateway=`echo "$pingResult" |grep "round-trip" | cut -d "=" -f 2 | cut -d "/" -f 1`
echo "ddwrt.perf.ping.gateway.packetloss.percent $packet $date" | nc $server $port ;
echo "ddwrt.perf.ping.gateway.latency $gateway $date" | nc $server $port ;
