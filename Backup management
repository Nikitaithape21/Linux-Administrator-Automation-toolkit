#!/bin/bash
clear
while true; do
echo "--------------------------  Welcome To File Backup Management Module  ---------------------------"
echo "Please select the option:"
echo "  1  : Create a new backup"
echo "  2  : Restore a backup"
echo "  3  : List all backup files"
echo "  4  : Delete a backup"
echo "  5  : Compress a backup (gzip)"
echo "  6  : Decompress a backup (gunzip)"
echo "  7  : Find a specific backup file by name"
echo "  8  : Find backups based on size"
echo "  9  : Search for files inside a backup"
echo " 10  : Set file permissions for backups"
echo " 11  : Set file ownership for backups"
echo " 12  : Set ACL permissions for backups"
echo "--------------------------------------------------------------------------------------------"
read -p "Please enter the option between 1 to 12: " backupchoice
echo "You have selected option $backupchoice"
echo "--------------------------------------------------------------------------------------------"

case $backupchoice in
  1)
    read -p "Enter the directory or file to backup: " source
    read -p "Enter backup file name (e.g., backup.tar.gz): " backupname
    if tar -czf "$backupname" "$source"
then
      echo "Backup '$backupname' created successfully"
    else
      echo "Failed to create backup"
    fi
    ;;
  2)
    read -p "Enter the backup file to restore: " backupfile
    read -p "Enter the destination directory to restore to: " destdir
    if tar -xzf "$backupfile" -C "$destdir"
then
      echo "Backup '$backupfile' restored successfully to '$destdir'"
    else
      echo "Failed to restore backup"
    fi
    ;;
  3)
    echo "Listing all backup files in the current directory:"
    ls *.tar.gz
    ;;
  4)
    read -p "Enter the backup file to delete: " backupfile
    if rm -f "$backupfile"; then
      echo "Backup '$backupfile' deleted successfully"
    else
      echo "Failed to delete backup"
    fi
    ;;
  5)
    read -p "Enter backup file name to compress: " backupfile
    if gzip "$backupfile"
 then
      echo "Backup '$backupfile' compressed successfully"
    else
      echo "Failed to compress backup"
    fi
    ;;
  6)
    read -p "Enter .gz backup file name to decompress: " backupfile
    if gunzip "$backupfile"
then
      echo "Backup '$backupfile' decompressed successfully"
    else
      echo "Failed to decompress backup"
    fi
    ;;
  7)
    read -p "Enter backup file name to search: " backupfile
    find . -name "$backupfile"
    ;;
  8)
    read -p "Enter size (e.g. +10M, -1G): " size
    echo "Finding backups of size '$size':"
    find . -name "*.tar.gz" -size "$size"
    ;;
  9)
    read -p "Enter text to search inside the backup: " searchtext
    read -p "Enter the backup file to search in: " backupfile
    tar -xOzf "$backupfile" | grep "$searchtext"
    ;;
  10)
    read -p "Enter permission (e.g., 755): " perm
    read -p "Enter backup file name to change permissions: " backupfile
    if chmod "$perm" "$backupfile"; then
      echo "Permissions for '$backupfile' changed successfully"
    else
      echo "Failed to change permissions"
    fi
    ;;
  11)
    read -p "Enter new owner username: " owner
    read -p "Enter backup file name to change ownership: " backupfile
    if sudo chown "$owner" "$backupfile"; then
      echo "Ownership for '$backupfile' changed successfully"
    else
      echo "Failed to change ownership"
    fi
    ;;
  12)
    read -p "Enter username: " user
    read -p "Enter permission (e.g. rwx): " perm
    read -p "Enter backup file name to set ACL: " backupfile
    if sudo setfacl -m u:"$user":"$perm" "$backupfile"; then
      echo "ACL set for '$backupfile' successfully"
    else
      echo "Failed to set ACL"
    fi
    ;;
  *)
    echo "Invalid input. Please select a valid option between 1 to 12."
    ;;
esac
done
