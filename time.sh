#!/bin/bash
while true
do
#now=`date +%H:%M:%S.%N`
now=`date +%H:%M:%S`
ns=`date +%N`
#echo ns=$ns
#let "ns = ns / 1000000"
#now+=$ns
#now = $now $point$ns
#echo $now"."$ns
echo $now
sleep 0.25
done