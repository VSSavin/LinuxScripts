while true;
do
  ping -c1 google.com
  if [ $? -eq 0 ]
  then 
    echo `date` : Ping ok!
  else
     echo `date` : Ping failed! >> /root/pingLogs.txt
  fi
sleep 5
done