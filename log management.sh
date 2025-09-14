#!/bin/bash
clear
while true; do
  echo "-------------------------  Welcome To Log File Management Module  -------------------------"
  echo "Please select an option:"
  echo "  1  : Show log files in a directory"
  echo "  2  : Check size of a specific log file"
  echo "  3  : Show top 10 largest log files"
  echo "  4  : Find log files by name"
  echo "  5  : Delete old log files (older than 7 days)"
  echo "  6  : Clear contents of a log file"
  echo "  7  : Compress a log file"
  echo "  8  : Rotate a log file (create backup and clear)"
  echo "  9  : View a log file (with paging)"
  echo " 10  : Search for a pattern in log files"
  echo " 11  : Tail log file (real-time updates)"
  echo " 12  : Show disk usage for log files"
  echo "  0  : Exit"
  echo "------------------------------------------------------------------------------------------------"
  read -r -p "Please enter your choice (0-12): " choice
  echo "You selected option $choice"
  echo "------------------------------------------------------------------------------------------------"

  case $choice in
    0)
      echo "Exiting Log File Management Module. Goodbye!"
      exit 0
      ;;
    1)
      read -r -p "Enter directory path to list log files (e.g. /var/log): " path
      echo "Log files in '$path':"
      find "$path" -type f -name "*.log" -exec ls -lh {} \;
      ;;
    2)
      read -r -p "Enter log file path to check size: " logfile
      if [ -f "$logfile" ]; then
        echo "Size of '$logfile':"
        du -sh "$logfile"
      else
        echo "Log file not found."
      fi
      ;;
    3)
      read -r -p "Enter path to analyze (e.g. /var/log): " path
      echo "Top 10 largest log files:"
      find "$path" -type f -name "*.log" -exec du -sh {} + | sort -rh | head -n 10
      ;;
    4)
      read -r -p "Enter log file name to search for (e.g. syslog): " logname
      read -r -p "Enter path to search in (e.g. /var/log): " path
      find "$path" -type f -name "*$logname*" -exec ls -lh {} \;
      ;;
    5)
      read -r -p "Enter log directory to delete old files from (e.g. /var/log): " logdir
      find "$logdir" -type f -name "*.log" -mtime +7 -exec sudo rm -f {} \;
      echo "Old log files (older than 7 days) removed."
      ;;
    6)
      read -r -p "Enter log file to clear (e.g. /var/log/syslog): " logfile
      if [ -f "$logfile" ]; then
        sudo truncate -s 0 "$logfile"
        echo "Log file '$logfile' has been cleared."
      else
        echo "Log file not found."
      fi
      ;;
    7)
      read -r -p "Enter log file to compress (e.g. /var/log/syslog): " logfile
      if [ -f "$logfile" ]; then
        gzip "$logfile"
        echo "Log file '$logfile' has been compressed."
      else
        echo "Log file not found."
      fi
      ;;
    8)
      read -r -p "Enter log file to rotate (e.g. /var/log/syslog): " logfile
      if [ -f "$logfile" ]; then
        mv "$logfile" "$logfile.bak"
        sudo touch "$logfile"
        sudo systemctl restart syslog
        echo "Log file '$logfile' has been rotated (backup created as '$logfile.bak')."
      else
        echo "Log file not found."
      fi
      ;;
    9)
      read -r -p "Enter log file to view (e.g. /var/log/syslog): " logfile
      if [ -f "$logfile" ]; then
        less "$logfile"
      else
        echo "Log file not found."
      fi
      ;;
    10)
      read -r -p "Enter pattern to search for (e.g. error): " pattern
      read -r -p "Enter log file to search in (e.g. /var/log/syslog): " logfile
      if [ -f "$logfile" ]; then
        grep -i "$pattern" "$logfile"
      else
        echo "Log file not found."
      fi
      ;;
    11)
      read -r -p "Enter log file to tail (e.g. /var/log/syslog): " logfile
      if [ -f "$logfile" ]; then
        tail -f "$logfile"
      else
        echo "Log file not found."
      fi
      ;;
    12)
      read -r -p "Enter log directory to check disk usage (e.g. /var/log): " path
      echo "Disk usage for log files in '$path':"
      du -sh "$path/*.log" 2>/dev/null
      ;;
    *)
      echo "Invalid option. Please choose between 0 and 12."
      ;;
  esac

  echo -e "\nPress Enter to return to the menu..."
  read
done


