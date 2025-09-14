#!/bin/bash
clear
while true; do
echo "-------------------------  Welcome To Process Management Module  --------------------------"
echo "Please select the option:"
echo "  1  : View all running processes"
echo "  2  : View processes by user"
echo "  3  : View top resource-consuming processes"
echo "  4  : Search process by name"
echo "  5  : Search process by PID"
echo "  6  : Kill process by PID"
echo "  7  : Kill process by name"
echo "  8  : Stop (pause) a process"
echo "  9  : Resume a stopped process"
echo " 10  : Start a background process"
echo " 11  : View background jobs"
echo " 12  : Bring background job to foreground"
echo " 13  : View process tree"
echo " 14  : View process status"
echo " 15  : View process memory usage"
echo " 16  : View process CPU usage"
echo " 17  : View parent and child processes"
echo " 18  : Renice a process"
echo " 19  : Monitor a process live (top)"
echo " 20  : View zombie processes"
echo "------------------------------------------------------------------------------------------------"
read -p "Please enter the option between 1 to 20: " pchoice
echo "You have selected option $pchoice"
echo "------------------------------------------------------------------------------------------------"

case $pchoice in
  1)
    ps aux
    ;;
  2)
    read -p "Enter username: " user
    ps -u "$user"
    ;;
  3)
    ps aux --sort=-%mem | head -n 10
    ;;
  4)
    read -p "Enter process name to search: " pname
    pgrep -fl "$pname"
    ;;
  5)
    read -p "Enter PID to search: " pid
    if ps -p "$pid" > /dev/null; then
      ps -p "$pid" -o pid,ppid,cmd,%mem,%cpu
    else
      echo "Process with PID $pid not found"
    fi
    ;;
  6)
    read -p "Enter PID to kill: " pid
    if kill "$pid"; then
      echo "Process $pid killed"
    else
      echo "Failed to kill process"
    fi
    ;;
  7)
    read -p "Enter process name to kill: " pname
    if pkill "$pname"; then
      echo "Process '$pname' killed"
    else
      echo "Failed to kill process"
    fi
    ;;
  8)
    read -p "Enter PID to stop: " pid
    if kill -STOP "$pid"; then
      echo "Process $pid stopped"
    else
      echo "Failed to stop process"
    fi
    ;;
  9)
    read -p "Enter PID to resume: " pid
    if kill -CONT "$pid"; then
      echo "Process $pid resumed"
    else
      echo "Failed to resume process"
    fi
    ;;
  10)
    read -p "Enter command to run in background: " cmd
    $cmd &
    echo "Process started in background with PID $!"
    ;;
  11)
    jobs
    ;;
  12)
    read -p "Enter job number (e.g. %1): " job
    fg "$job"
    ;;
  13)
    pstree -p
    ;;
  14)
    read -p "Enter PID to view status: " pid
    if [ -d "/proc/$pid" ]
 then
      cat "/proc/$pid/status"
    else
      echo "Process not found"
    fi
    ;;
  15)
    read -p "Enter PID to view memory usage: " pid
    if [ -d "/proc/$pid" ]; then
      grep VmRSS "/proc/$pid/status"
    else
      echo "Process not found"
    fi
    ;;
  16)
    read -p "Enter PID to view CPU usage: " pid
    top -p "$pid" -n 1
    ;;
  17)
    read -p "Enter PID to view parent and child: " pid
    ppid=$(ps -o ppid= -p "$pid")
    echo "Parent PID: $ppid"
    echo "Child processes:"
    ps --ppid "$pid"
    ;;
  18)
    read -p "Enter PID to renice: " pid
    read -p "Enter new nice value (-20 to 19): " niceval
    if sudo renice "$niceval" -p "$pid"; then
      echo "Process $pid reniced to $niceval"
    else
      echo "Failed to renice process"
    fi
    ;;
  19)
    read -p "Enter PID to monitor: " pid
    top -p "$pid"
    ;;
  20)
    echo "Zombie processes:"
    ps aux | awk '$8=="Z"'
    ;;
  *)
    echo "Invalid input. Please select a valid option between 1 to 20."
    ;;
esac
done
