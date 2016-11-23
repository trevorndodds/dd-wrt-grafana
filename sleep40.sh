#!/bin/sh
sleep 40
/jffs/checkConnections.sh &
/jffs/pingGateway.sh &
/jffs/pingGoogle.sh &
/jffs/pingLab.sh &
/jffs/checkLoad.sh &
/jffs/checkCPUTemp.sh &
/jffs/checkMem.sh &
/jffs/checkCPU.sh &
/jffs/checkWirelessClients.sh &
