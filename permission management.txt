#!/bin/bash
clear
while true; do
echo "-------------------------  Welcome To Permission Management Module  --------------------------"
echo "Please select the option:"
echo "  1  : View file permissions (ls -l)"
echo "  2  : Change file permissions (chmod)"
echo "  3  : Change file ownership (chown)"
echo "  4  : Change file group (chgrp)"
echo "  5  : View default permission mask (umask)"
echo "  6  : Set default permission mask (umask)"
echo "  7  : Set ACL for user (setfacl)"
echo "  8  : Set ACL for group (setfacl)"
echo "  9  : View ACL permissions (getfacl)"
echo " 10  : Remove ACL permissions"
echo " 11  : Set recursive permissions (chmod -R)"
echo " 12  : Make file read-only"
echo " 13  : Make file executable"
echo " 14  : Grant full access to user"
echo " 15  : Revoke all permissions from others"
echo " 16  : View symbolic permissions"
echo " 17  : View numeric permissions"
echo " 18  : Compare permissions of two files"
echo " 19  : Audit ACL entries"
echo " 20  : Reset permissions to default"
echo "------------------------------------------------------------------------------------------------"
read -p "Please enter the option between 1 to 20: " permchoice
echo "You have selected option $permchoice"
echo "------------------------------------------------------------------------------------------------"

case $permchoice in
  1)
    read -p "Enter file/directory name: " name
    ls -l "$name"
    ;;
  2)
    read -p "Enter permission (e.g. 755): " perm
    read -p "Enter file/directory name: " name
    chmod "$perm" "$name" && echo "Permissions changed" || echo "Failed to change permissions"
    ;;
  3)
    read -p "Enter new owner username: " owner
    read -p "Enter file/directory name: " name
    sudo chown "$owner" "$name" && echo "Ownership changed" || echo "Failed to change ownership"
    ;;
  4)
    read -p "Enter new group name: " group
    read -p "Enter file/directory name: " name
    sudo chgrp "$group" "$name" && echo "Group changed" || echo "Failed to change group"
    ;;
  5)
    current_umask=$(umask)
    echo "Current umask value: $current_umask"
    ;;
  6)
    read -p "Enter new umask value (e.g. 022): " new_umask
    case $new_umask in
      [0-7][0-7][0-7])
        umask "$new_umask"
        echo "Umask set to $new_umask (Note: affects only current shell session)"
        ;;
      *)
        echo "Invalid umask format. Use three digits (e.g. 022)"
        ;;
    esac
    ;;
  7)
    read -p "Enter username: " user
    read -p "Enter permission (e.g. rwx): " perm
    read -p "Enter file/directory name: " name
    sudo setfacl -m u:"$user":"$perm" "$name" && echo "ACL set for user" || echo "Failed to set ACL"
    ;;
  8)
    read -p "Enter group name: " group
    read -p "Enter permission (e.g. rwx): " perm
    read -p "Enter file/directory name: " name
    sudo setfacl -m g:"$group":"$perm" "$name" && echo "ACL set for group" || echo "Failed to set ACL"
    ;;
  9)
    read -p "Enter file/directory name: " name
    getfacl "$name"
    ;;
  10)
    read -p "Enter file/directory name: " name
    sudo setfacl -b "$name" && echo "ACL removed" || echo "Failed to remove ACL"
    ;;
  11)
    read -p "Enter permission (e.g. 755): " perm
    read -p "Enter directory name: " dirname
    chmod -R "$perm" "$dirname" && echo "Recursive permissions applied" || echo "Failed to apply"
    ;;
  12)
    read -p "Enter file name: " filename
    chmod a-w "$filename" && echo "File made read-only" || echo "Failed to change"
    ;;
  13)
    read -p "Enter file name: " filename
    chmod +x "$filename" && echo "File made executable" || echo "Failed to change"
    ;;
  14)
    read -p "Enter username: " user
    read -p "Enter file name: " filename
    sudo setfacl -m u:"$user":rwx "$filename" && echo "Full access granted" || echo "Failed to grant"
    ;;
  15)
    read -p "Enter file name: " filename
    chmod o-rwx "$filename" && echo "Permissions revoked from others" || echo "Failed to revoke"
    ;;
  16)
    read -p "Enter file name: " filename
    ls -l "$filename" | awk '{print $1}'
    ;;
  17)
    read -p "Enter file name: " filename
    stat -c "%a" "$filename"
    ;;
  18)
    read -p "Enter first file name: " file1
    read -p "Enter second file name: " file2
    perm1=$(stat -c "%a" "$file1")
    perm2=$(stat -c "%a" "$file2")
    echo "$file1: $perm1"
    echo "$file2: $perm2"
    ;;
  19)
    read -p "Enter file name: " filename
    getfacl "$filename" | grep -v '^#'
    ;;
  20)
    read -p "Enter file name: " filename
    chmod 644 "$filename" && echo "Permissions reset to default (644)" || echo "Failed to reset"
    ;;
  *)
    echo "Invalid input. Please select a valid option between 1 to 20."
    ;;
ecas
done
