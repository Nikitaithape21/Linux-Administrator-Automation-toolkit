#!/bin/bash
clear
while true; do
echo "---------------------------- System Resource Management Menu ----------------------------"
echo "  1  : Show system uptime"
echo "  2  : Show current CPU usage"
echo "  3  : Show current memory usage"
echo "  4  : Show disk usage"
echo "  5  : Show top 10 memory-consuming processes"
echo "  6  : Show top 10 CPU-consuming processes"
echo "  7  : Show active users"
echo "  8  : Show currently running processes"
echo "  9  : Show open ports and listening services"
echo " 10  : Show system load averages"
echo " 11  : Show swap usage"
echo " 12  : Show file system inodes usage"
echo " 13  : Show system boot time"
echo " 14  : Show CPU information"
echo " 15  : Show memory information"
echo "  0  : Exit"
echo "------------------------------------------------------------------------------------------"
read -p "Enter your choice (0 to 15): " choice
echo "------------------------------------------------------------------------------------------"

case $choice in
  1)
    echo "System Uptime:"
    uptime
    ;;
  2)
    echo "Current CPU Usage:"
    top -bn1 | grep "Cpu(s)"
    ;;
  3)
    echo "Current Memory Usage:"
    free -h
    ;;
  4)
    echo "Disk Usage:"
    df -h
    ;;
  5)
    echo "Top 10 Memory-Consuming Processes:"
    ps aux --sort=-%mem | head -n 11
    ;;
  6)
    echo "Top 10 CPU-Consuming Processes:"
    ps aux --sort=-%cpu | head -n 11
    ;;
  7)
    echo "Active Users:"
    who
    ;;
  8)
    echo "Running Processes:"
    ps -ef | less
    ;;
  9)
    echo "Open Ports and Listening Services:"
    sudo ss -tuln
    ;;
  10)
    echo "System Load Averages (1, 5, 15 min):"
    cat /proc/loadavg
    ;;
  11)
    echo "Swap Usage:"
    swapon --show
    ;;
  12)
    echo "Inodes Usage:"
    df -ih
    ;;
  13)
    echo "System Boot Time:"
    who -b
    ;;
  14)
    echo "CPU Information:"
    lscpu
    ;;
  15)
    echo "Memory Information:"
    cat /proc/meminfo | less
    ;;
  0)
    echo "Exiting Resource Management Script. Goodbye!"
    ;;
  *)
    echo "Invalid input. Please select a number between 0 and 15."
    ;;
esac
done
