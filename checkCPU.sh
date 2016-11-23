#!/bin/sh
date="$( date +%s )"
server="192.168.1.54"
port="2003"
cpu=`cat /proc/stat | head -n1 | sed 's/cpu //'`
user=`echo $cpu | awk '{print $1}'`
nice=`echo $cpu | awk '{print $2}'`
system=`echo $cpu | awk '{print $3}'`
idle=`echo $cpu | awk '{print $4}'`
iowait=`echo $cpu | awk '{print $5}'`
irq=`echo $cpu | awk '{print $6}'`
softirq=`echo $cpu | awk '{print $7}'`
steal=`echo $cpu | awk '{print $8}'`
guest=`echo $cpu | awk '{print $9}'`
guest_nice=`echo $cpu | awk '{print $10}'`
echo "ddwrt.perf.cpu.user $user $date" | nc $server $port ;
echo "ddwrt.perf.cpu.nice $nice $date" | nc $server $port ;
echo "ddwrt.perf.cpu.system $system $date" | nc $server $port ;
echo "ddwrt.perf.cpu.idle $idle $date" | nc $server $port ;
echo "ddwrt.perf.cpu.iowait $iowait $date" | nc $server $port ;
echo "ddwrt.perf.cpu.irq $irq $date" | nc $server $port ;
echo "ddwrt.perf.cpu.softirq $softirq $date" | nc $server $port ;
echo "ddwrt.perf.cpu.steal $steal $date" | nc $server $port ;
echo "ddwrt.perf.cpu.guest $guest $date" | nc $server $port ;
echo "ddwrt.perf.cpu.guest_nice $guest_nice $date" | nc $server $port ;
