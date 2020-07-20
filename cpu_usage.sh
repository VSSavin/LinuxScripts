CPU_USAGE=$(top -b -n2 -p 1 | grep "Cpu(s)" | tail -1 | awk '{ print $8 }' | cut -c1-2)
#CPU_USAGE=$(top -b -n5 -p 1 | grep "Cpu(s)" | tail -1 | awk '{ print $8 }' | cut -c1-2)
let "CPU_USAGE=100 - $CPU_USAGE"
echo $CPU_USAGE
