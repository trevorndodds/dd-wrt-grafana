#!/bin/sh
date="$( date +%s )"
server="192.168.1.54"
port="2003"
load=`cat /proc/loadavg`
load1=`echo "$load" | awk '{print $1}'`
load5=`echo "$load" | awk '{print $2}'`
load15=`echo "$load" | awk '{print $3}'`
proc_run=`echo "$load" | awk '{print $4}' | awk -F '/' '{print $1}'`
proc_total=`echo "$load" | awk '{print $4}' | awk -F '/' '{print $2}'`
echo "ddwrt.perf.load.load_one.number $load1 $date" | nc $server $port ;
echo "ddwrt.perf.load.load_five.number $load5 $date" | nc $server $port ;
echo "ddwrt.perf.load.load_fifteen.number $load15 $date" | nc $server $port ;
echo "ddwrt.perf.load.proc_run.number $proc_run $date" | nc $server $port ;
echo "ddwrt.perf.load.proc_total.number $proc_total $date" | nc $server $port ;
