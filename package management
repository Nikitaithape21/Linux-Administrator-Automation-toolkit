#!/bin/bash
clear
while true; do
echo "---------------------------- YUM Package Management Menu ----------------------------"
echo "  1  : Update all packages"
echo "  2  : Install a package"
echo "  3  : Remove a package"
echo "  4  : Search for a package"
echo "  5  : Show package details"
echo "  6  : Clean YUM cache"
echo "  7  : List all installed packages"
echo "  8  : Check for available updates"
echo "  9  : List enabled repositories"
echo " 10  : Install a group of packages"
echo " 11  : Check if a package is installed"
echo " 12  : List all available packages"
echo " 13  : Show package dependencies"
echo " 14  : Reinstall a package"
echo " 15  : List recently installed packages"
echo " 16  : Show files installed by a package"
echo "  0  : Exit"
echo "--------------------------------------------------------------------------------------"
read -p "Enter your choice (0 to 16): " choice
echo "--------------------------------------------------------------------------------------"

case $choice in
  1)
    echo "Updating all packages..."
    sudo yum update -y
    ;;
  2)
    read -p "Enter package name to install: " pkg
    sudo yum install -y "$pkg"
    ;;
  3)
    read -p "Enter package name to remove: " pkg
    sudo yum remove -y "$pkg"
    ;;
  4)
    read -p "Enter keyword to search: " keyword
    yum search "$keyword"
    ;;
  5)
    read -p "Enter package name for details: " pkg
    yum info "$pkg"
    ;;
  6)
    echo "Cleaning YUM cache..."
    sudo yum clean all
    ;;
  7)
    echo "Listing all installed packages..."
    yum list installed | less
    ;;
  8)
    echo "Checking for available updates..."
    yum check-update
    ;;
  9)
    echo "Enabled repositories:"
    yum repolist enabled
    ;;
  10)
    read -p "Enter group name to install (use 'yum group list' to view groups): " group
    sudo yum groupinstall -y "$group"
    ;;
  11)
    read -p "Enter package name to check: " pkg
    if rpm -q "$pkg" > /dev/null 2>&1; then
      echo "Package '$pkg' is installed."
    else
      echo "Package '$pkg' is NOT installed."
    fi
    ;;
  12)
    echo "Listing all available packages..."
    yum list available | less
    ;;
  13)
    read -p "Enter package name to view dependencies: " pkg
    yum deplist "$pkg"
    ;;
  14)
    read -p "Enter package name to reinstall: " pkg
    sudo yum reinstall -y "$pkg"
    ;;
  15)
    echo "Recently installed packages:"
    grep "Installed:" /var/log/yum.log | tail -20
    ;;
  16)
    read -p "Enter package name to list files: " pkg
    rpm -ql "$pkg"
    ;;
  0)
    echo "Exiting Package Management Script. Goodbye!"
    ;;
  *)
    echo "Invalid option. Please choose a number between 0 and 16."
    ;;
esac
done
