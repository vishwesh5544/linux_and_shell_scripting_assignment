#!/bin/bash

# File to save the report
REPORT_FILE="system_report.txt"

# Get system uptime
uptime_info=$(uptime -p)

# Get memory usage
memory_info=$(free -h)

# Get CPU load
cpu_load=$(top -bn1 | grep "load average" | awk '{printf "CPU Load: %.2f\n", $(NF-2)}')

# Get disk usage
disk_usage=$(df -h /)

# Get running processes
processes=$(ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 11)

# Create the report
report_content=$(cat <<EOF
System Information Report
=========================

System Uptime:
$uptime_info

Memory Usage:
$memory_info

$cpu_load

Disk Usage:
$disk_usage

Top 10 Memory-Consuming Processes:
$processes

EOF
)

# Save the report to a file
echo "$report_content" > "$REPORT_FILE"

# Print the report to the console
echo "$report_content"

# Notify the user
echo "System information report saved to $REPORT_FILE"
