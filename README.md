
# Server-Performance-Stats
https://roadmap.sh/projects/server-stats

## 📊 System Monitoring Script

A lightweight Bash script to monitor Linux system resources including CPU, Memory, and Disk usage, as well as process tracking.

### 🚀 Features
* **Real-time CPU Load:** Calculates current load by sampling CPU ticks.
* **Memory Analysis:** Displays used vs. total RAM with percentage.
* **Storage Tracking:** Summarizes total disk usage across all partitions.
* **Process Triage:** Lists top 5 resource-heavy processes for both CPU and RAM.

📋 Sample Output

# ==========================================
      SYSTEM PERFORMANCE REPORT           
# ==========================================
CPU Load:       12.5%
Memory:         Used: 1420MB / Total: 7950MB (17.86%)
Disk:           Used: 45G / Total: 220G (21%)

Top 5 Processes by CPU:
  PID  %CPU %MEM COMMAND
 1234  5.5  1.2  node
 5678  2.1  0.5  python3
 ...
 ---
 
### 3. How the data is gathered
For your technical documentation, here is how the script interacts with the Linux kernel:

* **CPU:** Pulled from `top` using batch mode (`-b`) to ensure it doesn't try to open a full UI window in your terminal.
* **Memory:** Gathered from `free`, which reads `/proc/meminfo`.
* **Disk:** Gathered from `df`, which queries the filesystem blocks.
* **Processes:** Pulled from `ps`, which looks at the `/proc/[pid]` directories.

**Would you like me to help you create a GitHub Action that automatically tests this script on different versions of Linux (Ubuntu, Debian, CentOS)?**
