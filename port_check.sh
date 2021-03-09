#!/bin/bash

host=192.168.1.10
port=1099


start=0
while [ $? -ne 0 ] || [ ! $start -ne 0 ]
do
	start=1
	echo 'wait...'
	sleep 1
	nc -z $host $port
	done
echo 'port opened'