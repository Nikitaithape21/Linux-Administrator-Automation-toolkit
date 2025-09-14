#!/bin/bash
clear
while true; do
echo "-------------------------  Welcome To Group Management Module  --------------------------"
echo "Please select the option:"
echo "  1  : Add new group"
echo "  2  : Delete group"
echo "  3  : Modify group name"
echo "  4  : Add user to group"
echo "  5  : Remove user from group"
echo "  6  : View all groups"
echo "  7  : View members of a specific group"
echo "  8  : View groups of a specific user"
echo "  9  : Create a system group"
echo " 10  : Change group ID (GID)"
echo " 11  : View full group details"
echo " 12  : List users in multiple groups"
echo " 13  : Check if user belongs to a group"
echo " 14  : Set group password (gpasswd)"
echo " 15  : Remove group password"
echo " 16  : Make group administrator"
echo " 17  : Lock group (restrict access)"
echo " 18  : Unlock group"
echo " 19  : View primary group of a user"
echo " 20  : View all system groups"
echo "------------------------------------------------------------------------------------------"
read -p "Please enter the option between 1 to 20: " groupchoice
echo "You have selected option $groupchoice"
echo "------------------------------------------------------------------------------------------"

case $groupchoice in
  1)
    read -p "Enter new group name: " groupname
    if sudo groupadd "$groupname"; then
      echo "Group '$groupname' created successfully"
    else
      echo "Failed to create group"
    fi
    ;;
  2)
    read -p "Enter group name to delete: " groupname
    if sudo groupdel "$groupname"; then
      echo "Group '$groupname' deleted successfully"
    else
      echo "Failed to delete group"
    fi
    ;;
  3)
    read -p "Enter current group name: " oldgroup
    read -p "Enter new group name: " newgroup
    if sudo groupmod -n "$newgroup" "$oldgroup"; then
      echo "Group name changed from '$oldgroup' to '$newgroup'"
    else
      echo "Failed to change group name"
    fi
    ;;
  4)
    read -p "Enter username: " username
    read -p "Enter group name: " groupname
    if sudo usermod -aG "$groupname" "$username"; then
      echo "User '$username' added to group '$groupname'"
    else
      echo "Failed to add user to group"
    fi
    ;;
  5)
    read -p "Enter username: " username
    read -p "Enter group name: " groupname
    current_groups=$(id -nG "$username" | sed "s/\b$groupname\b//g" | tr ' ' ',')
    if sudo usermod -G "$current_groups" "$username"; then
      echo "User '$username' removed from group '$groupname'"
    else
      echo "Failed to remove user from group"
    fi
    ;;
  6)
    getent group | cut -d: -f1
    ;;
  7)
    read -p "Enter group name: " groupname
    members=$(getent group "$groupname" | cut -d: -f4)
    if [ -n "$members" ]; then
      echo "Members of group '$groupname': $members"
    else
      echo "Group not found or has no members"
    fi
    ;;
  8)
    read -p "Enter username: " username
    if groups "$username"; then
      echo "Groups listed for user '$username'"
    else
      echo "User not found"
    fi
    ;;
  9)
    read -p "Enter system group name: " groupname
    if sudo groupadd -r "$groupname"; then
      echo "System group '$groupname' created successfully"
    else
      echo "Failed to create system group"
    fi
    ;;
  10)
    read -p "Enter group name: " groupname
    read -p "Enter new GID: " newgid
    if sudo groupmod -g "$newgid" "$groupname"; then
      echo "GID for group '$groupname' changed to $newgid"
    else
      echo "Failed to change GID"
    fi
    ;;
  11)
    read -p "Enter group name: " groupname
    if getent group "$groupname"; then
      echo "Details displayed for group '$groupname'"
    else
      echo "Group not found"
    fi
    ;;
  12)
    read -p "Enter comma-separated group names (e.g. dev,admin): " grouplist
    IFS=',' read -ra groups <<< "$grouplist"
    for grp in "${groups[@]}"; do
      echo "Group: $grp"
      members=$(getent group "$grp" | cut -d: -f4)
      if [ -n "$members" ]; then
        echo "  Members: $members"
      else
        echo "  No members or group not found"
      fi
    done
    ;;
  13)
    read -p "Enter username: " username
    read -p "Enter group name: " groupname
    if id -nG "$username" | grep -qw "$groupname"
 then
      echo "Yes, '$username' belongs to group '$groupname'"
    else
      echo "No, '$username' does not belong to group '$groupname'"
    fi
    ;;
  14)
    read -p "Enter group name to set password: " groupname
    if sudo gpasswd "$groupname"; then
      echo "Password set for group '$groupname'"
    else
      echo "Failed to set group password"
    fi
    ;;
  15)
    read -p "Enter group name to remove password: " groupname
    if sudo gpasswd -r "$groupname"; then
      echo "Password removed from group '$groupname'"
    else
      echo "Failed to remove group password"
    fi
    ;;
  16)
    read -p "Enter group name: " groupname
    read -p "Enter username to make admin: " username
    if sudo gpasswd -A "$username" "$groupname"; then
      echo "User '$username' is now administrator of group '$groupname'"
    else
      echo "Failed to assign group administrator"
    fi
    ;;
  17)
    read -p "Enter group name to lock: " groupname
    if sudo gpasswd -l "$groupname"; then
      echo "Group '$groupname' locked"
    else
      echo "Failed to lock group"
    fi
    ;;
  18)
    read -p "Enter group name to unlock: " groupname
    if sudo gpasswd -u "$groupname"; then
      echo "Group '$groupname' unlocked"
    else
      echo "Failed to unlock group"
    fi
    ;;
  19)
    read -p "Enter username: " username
    primary_group=$(id -gn "$username")
    echo "Primary group of '$username' is '$primary_group'"
    ;;
  20)
    echo "System groups:"
    getent group | awk -F: '$3 < 1000 {print $1}'
    ;;
  *)
    echo "Invalid input. Please select a valid option between 1 to 20."
    ;;
esac
done 
