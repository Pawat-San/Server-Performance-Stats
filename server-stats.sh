#!/bin/bash

# System Monitoring Script
# Author: Your Name
# Description: Reports CPU, Memory, Disk usage and top processes.

echo "=========================================="
echo "      SYSTEM PERFORMANCE REPORT           "
echo "      $(date)"
echo "=========================================="

# 1. Total CPU Usage
# Uses two samples to avoid the "since boot" average issue
get_cpu_usage() {
    local cpu_load=$(top -bn2 -d 0.5 | grep "Cpu(s)" | tail -1 | awk '{print 100 - $8}')
    echo -e "CPU Load:\t$cpu_load%"
}

# 2. Total Memory Usage
get_memory_usage() {
    free -m | awk '/Mem:/ {
        usage_pct = ($3 / $2) * 100
        printf "Memory:\t\tUsed: %dMB / Total: %dMB (%.2f%%)\n", $3, $2, usage_pct
    }'
}

# 3. Total Disk Usage
get_disk_usage() {
    # -h for human readable, --total for the bottom line
    df -h --total | awk '/total/ {
        gsub(/%/, "", $5); 
        printf "Disk:\t\tUsed: %s / Total: %s (%s%%)\n", $3, $2, $5
    }'
}

# 4. Top Processes
get_top_processes() {
    echo -e "\nTop 5 Processes by CPU:"
    ps -eo pid,%cpu,%mem,comm --sort=-%cpu | head -n 6
    
    echo -e "\nTop 5 Processes by Memory:"
    ps -eo pid,%cpu,%mem,comm --sort=-%mem | head -n 6
}

# Execute functions
get_cpu_usage
get_memory_usage
get_disk_usage
get_top_processes

echo "=========================================="
