#!/bin/sh
date="$( date +%s )"
server="192.168.1.54"
port="2003"
mem=`cat /proc/meminfo`
total=`echo "$mem" | grep ^MemTotal | awk '{print $2}'`
free=`echo "$mem" | grep ^MemFree | awk '{print $2}'`
used=`echo "$mem" | grep ^Mem: | awk '{print $3}'`
buffers=`echo "$mem" | grep ^Buffers | awk '{print $2}'`
cached=`echo "$mem" | grep ^Cached: | awk '{print $2}'`
active=`echo "$mem" | grep ^Active: | awk '{print $2}'`
inactive=`echo "$mem" | grep ^Inactive: | awk '{print $2}'`
echo "ddwrt.perf.mem.total.kilobytes $total $date" | nc $server $port ;
echo "ddwrt.perf.mem.free.kilobytes $free $date" | nc $server $port ;
echo "ddwrt.perf.mem.used.bytes $used $date" | nc $server $port ;
echo "ddwrt.perf.mem.buffers.kilobytes $buffers $date" | nc $server $port ;
echo "ddwrt.perf.mem.cached.kilobytes $cached $date" | nc $server $port ;
echo "ddwrt.perf.mem.active.kilobytes $active $date" | nc $server $port ;
echo "ddwrt.perf.mem.inactive.kilobytes $inactive $date" | nc $server $port ;
