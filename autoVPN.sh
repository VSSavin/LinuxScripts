#!/bin/bash
let START_TIMEOUT=5
let CHECK_TIMEOUT=60
SERVER_IP_ADDR="192.168.100.1"
VPN_CONNECTION_NAME="VPN_firstvds.ru"
NET_CONNECTION_NAME="vpn_net"

sleep $START_TIMEOUT
dt=$(date '+%d/%m/%Y %H:%M:%S')
echo "$dt starting script" >> testVPN.log
while true
do
	dt=$(date '+%d/%m/%Y %H:%M:%S')
	#if ping -c 1 ${SERVER_IP_ADDR} &> /dev/null
	#ping -c 1 ${SERVER_IP_ADDR} &> /dev/null
	pingResult=$(ping -c 1 ${SERVER_IP_ADDR})
	#if [ "$pingResult" = 0 ]
	if [ "$?" = 0 ]
		then
			 echo "$dt server found"
			 echo "$dt server found" >> testVPN.log
			 #pingResult=$(ping -c 1 ${SERVER_IP_ADDR})
			 #echo "ping result:" >> testVPN.log
			 #echo $pingResult >> testVPN.log
		else
			 echo "$dt server not found!"
			 #pingResult=$(ping -c 1 ${SERVER_IP_ADDR})
			 echo "ping result:" >> testVPN.log
			 echo $pingResult >> testVPN.log
			 echo "$dt server not found! Starting VPN!" >> testVPN.log
			 nmcli con down id ${NET_CONNECTION_NAME}
			 sleep 5
			 nmcli con up id ${NET_CONNECTION_NAME}
			sleep 15
			 nmcli con down id ${VPN_CONNECTION_NAME}
			 sleep 2
			 nmcli con up id ${VPN_CONNECTION_NAME}
			 echo "$dt Ended starting VPN!!" >> testVPN.log
	fi
sleep $CHECK_TIMEOUT
done