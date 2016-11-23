#!/bin/sh
date="$( date +%s )"
server="192.168.1.54"
port="2003"
connections=`cat /proc/net/nf_conntrack`
tcp=`echo "$connections" | grep ipv4 | grep tcp | wc -l`
udp=`echo "$connections" | grep ipv4 | grep udp | wc -l`
icmp=`echo "$connections" | grep ipv4 | grep icmp | wc -l`
total=`echo "$connections" | grep ipv4 | wc -l`
echo "ddwrt.perf.connections.tcp.number $tcp $date" | nc $server $port ;
echo "ddwrt.perf.connections.udp.number $udp $date" | nc $server $port ;
echo "ddwrt.perf.connections.icmp.number $icmp $date" | nc $server $port ;
echo "ddwrt.perf.connections.total $total $date" | nc $server $port ;
