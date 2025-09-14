#!/bin/bash
clear
while true; do
  echo "-------------------------  Welcome To Disk Space Management Module  -------------------------"
  echo "Please select an option:"
  echo "  1  : Show disk usage (df)"
  echo "  2  : Show disk usage in human-readable format"
  echo "  3  : Check disk usage for a specific directory"
  echo "  4  : List largest directories/files in a path"
  echo "  5  : Find files larger than a certain size"
  echo "  6  : Show inode usage"
  echo "  7  : Clean apt cache (Debian/Ubuntu)"
  echo "  8  : Remove old log files"
  echo "  9  : Empty trash (~/.local/share/Trash)"
  echo " 10  : Find and delete empty files/directories"
  echo " 11  : Compress large files/directories"
  echo " 12  : List mounted file systems"
  echo " 13  : Unmount a file system"
  echo " 14  : Show file system type"
  echo "  0  : Exit"
  echo "------------------------------------------------------------------------------------------------"
  read -r -p "Please enter your choice (0-14): " choice
  echo "You selected option $choice"
  echo "------------------------------------------------------------------------------------------------"

  case $choice in
    0)
      echo "Exiting Disk Space Management Module. Goodbye!"
      exit 0
      ;;
    1)
      echo "Disk usage (blocks):"
      df
      ;;
    2)
      echo "Disk usage (human-readable):"
      df -h
      ;;
    3)
      read -r -p "Enter directory path to check usage: " path
      du -sh "$path" 2>/dev/null || echo "Directory not found."
      ;;
    4)
      read -r -p "Enter path to analyze: " path
      echo "Top 10 largest directories/files:"
      du -ah "$path" 2>/dev/null | sort -rh | head -n 10
      ;;
    5)
      read -r -p "Enter path to search: " path
      read -r -p "Enter minimum file size (e.g. 100M, 1G): " size
      find "$path" -type f -size +"$size" -exec ls -lh {} \; 2>/dev/null | awk '{ print $9 ": " $5 }'
      ;;
    6)
      echo "Inode usage:"
      df -i
      ;;
    7)
      echo "Cleaning apt cache..."
      sudo apt-get clean
      echo "Apt cache cleaned."
      ;;
    8)
      read -r -p "Enter log directory (default: /var/log): " logdir
      logdir="${logdir:-/var/log}"
      find "$logdir" -name "*.log" -type f -mtime +7 -exec sudo rm -f {} \;
      echo "Old log files removed (older than 7 days)."
      ;;
    9)
      echo "Emptying trash..."
      rm -rf ~/.local/share/Trash/* || echo "No trash folder found."
      echo "Trash emptied."
      ;;
    10)
      read -r -p "Enter path to scan: " path
      echo "Removing empty files and directories..."
      find "$path" -type f -empty -delete
      find "$path" -type d -empty -delete
      echo "Empty files and directories removed."
      ;;
    11)
      read -r -p "Enter file or directory to compress: " target
      tar -czf "$target.tar.gz" "$target" && echo "Compressed to $target.tar.gz" || echo "Compression failed."
      ;;
    12)
      echo "Mounted file systems:"
      mount | column -t
      ;;
    13)
      read -r -p "Enter mount point to unmount (e.g. /mnt/usb): " mnt
      sudo umount "$mnt" && echo "Unmounted $mnt" || echo "Failed to unmount."
      ;;
    14)
      read -r -p "Enter mount point or device (e.g. /dev/sda1): " dev
      df -T "$dev"
      ;;
    *)
      echo "Invalid option. Please choose between 0 and 14."
      ;;
  esac

  echo -e "\nPress Enter to return to the menu..."
  read
done
