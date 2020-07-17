while true;
do
dd if=/dev/urandom | bzip2 -9 > /dev/null
sleep 0.001
done