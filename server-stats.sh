echo "==== SERVER STATS ===="
# CPU
top -bn1 | grep "Cpu(s)" | awk '{usage=100-$8} END {print "CPU Usage: " usage "%"}'
# Memory
free | awk 'NR==2{printf "Memory Usage: %.2f%%\n", $3/$2*100}'
# Disk
df -h | awk '$NF=="/"{printf "Disk Usage: %s used of %s (%s)\n",$3,$2,$5}'

echo -e "\nTop 5 Processes by CPU:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

echo -e "\nTop 5 Processes by Memory:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
