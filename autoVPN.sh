SERVER_IP_ADDR="192.168.100.1"
VPN_CONNECTION_NAME="test_vpn_connection"

sleep 30
dt=$(date '+%d/%m/%Y %H:%M:%S')
echo "$dt starting script" >> testVPN.log
while true
do
	dt=$(date '+%d/%m/%Y %H:%M:%S')
	#if ping -c 1 ${SERVER_IP_ADDR} &> /dev/null
	#ping -c 1 ${SERVER_IP_ADDR} &> /dev/null
	pingResult=$(ping -c 1 ${SERVER_IP_ADDR})
	if [ "$pingResult" = 0 ]
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
			 nmcli con down ${VPN_CONNECTION_NAME}
			 sleep 2
			 nmcli con up ${VPN_CONNECTION_NAME}
			 echo "$dt Ended starting VPN!!" >> testVPN.log
	fi
sleep 20
done