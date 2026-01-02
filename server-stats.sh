#!/bin/bash

echo "=========================================="
echo "      SYSTEM PERFORMANCE REPORT           "
echo "      $(date)"
echo "=========================================="

# 1. CPU
echo -e "\n[CPU]"
top -bn2 -d 0.5 | grep "Cpu(s)" | tail -1 | awk '{print "Load: " 100 - $8 "%"}'

# 2. Memory
echo -e "\n[Memory]"
free -m | awk '/Mem:/ {printf "Used: %dMB / Total: %dMB (%.2f%%)\n", $3, $2, $3/$2*100}'

# 3. Disk
echo -e "\n[Disk]"
df -h --total | awk '/total/ {gsub(/%/,"",$5); printf "Used: %s / Total: %s (%s%%)\n", $3, $2, $5}'

# 4. Top Processes
echo -e "\n[Top 5 CPU Processes]"
ps -eo pid,%cpu,%mem,comm --sort=-%cpu | head -n 6

echo -e "\n[Top 5 Memory Processes]"
ps -eo pid,%cpu,%mem,comm --sort=-%mem | head -n 6

echo "=========================================="