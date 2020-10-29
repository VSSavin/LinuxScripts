#!/bin/bash
let START_TIMEOUT=30
let CHECK_TIMEOUT=60
SERVER_IP_ADDR="192.168.100.1"
VPN_CONNECTION_NAME="VPN_firstvds.ru"
NET_CONNECTION_NAME="vpn_net"
STOP_VPN_FILE=vpn_stop.stop
LOG_FILE=testVPN.log

sleep $START_TIMEOUT
dt=$(date '+%d/%m/%Y %H:%M:%S')
echo "$dt starting script" >> $LOG_FILE
while true
do
	dt=$(date '+%d/%m/%Y %H:%M:%S')
	if [[ -f "$STOP_VPN_FILE" ]];
		then
			echo "$dt stop file exist!"
		else
			echo "$dt stop file NOT exist!"
			#if ping -c 1 ${SERVER_IP_ADDR} &> /dev/null
			#ping -c 1 ${SERVER_IP_ADDR} &> /dev/null
			pingResult=$(ping -c 1 ${SERVER_IP_ADDR})
			#if [ "$pingResult" = 0 ]
			if [ "$?" = 0 ]
				then
			 		echo "$dt server found"
		 			echo "$dt server found" >> $LOG_FILE
		 			#pingResult=$(ping -c 1 ${SERVER_IP_ADDR})
		 			#echo "ping result:" >> $LOG_FILE
		 			#echo $pingResult >> $LOG_FILE
				else
			 		echo "$dt server not found!"
			 		#pingResult=$(ping -c 1 ${SERVER_IP_ADDR})
			 		echo "ping result:" >> $LOG_FILE
			 		echo $pingResult >> $LOG_FILE
			 		echo "$dt server not found! Starting VPN!" >> $LOG_FILE
			 		nmcli con down id ${NET_CONNECTION_NAME}
			 		sleep 5
			 		nmcli con up id ${NET_CONNECTION_NAME}
					sleep 15
			 		nmcli con down id ${VPN_CONNECTION_NAME}
			 		sleep 2
			 		nmcli con up id ${VPN_CONNECTION_NAME}
			 		echo "$dt Ended starting VPN!!" >> $LOG_FILE
			fi
	fi
sleep $CHECK_TIMEOUT
done