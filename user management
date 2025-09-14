 #!/bin/bash
clear
while true; do
echo "-------------------------  Welcome To User Management Module  --------------------------"
echo "Please select an option:"
echo "  1  : Add new user account"
echo "  2  : Change user login name"
echo "  3  : Set or change user password"
echo "  4  : Delete user account"
echo "  5  : Show current logged in users"
echo "  6  : Set or change user ID"
echo "  7  : View user groups"
echo "  8  : Switch user account"
echo "  9  : Lock user account"
echo " 10  : Unlock user account"
echo " 11  : Add comment (full name)"
echo " 12  : Change user home directory"
echo " 13  : Change user shell"
echo " 14  : View user details"
echo " 15  : Set user account password policy"
echo "-----------------------------------------------------------------------------------------"
read -p "Please enter an option between 1 to 15: " userchoice
echo "You have selected option $userchoice"
echo "-----------------------------------------------------------------------------------------"

case $userchoice in

1)
  echo "Add new user account"
  read -p "Enter username: " name
  if sudo useradd "$name"; then
    echo "User account created successfully."
  else
    echo "User account creation failed."
  fi
  ;;

2)
  echo "Change user login name"
  read -p "Enter old username: " oldname
  read -p "Enter new username: " newname
  if sudo usermod -l "$newname" "$oldname";
 then
    echo "Username changed successfully."
  else
    echo "Failed to change username."
  fi
  ;;

3)
  echo "Set or change user password"
  read -p "Enter username: " name
  if sudo passwd "$name";
 then
    echo "Password set successfully."
  else
    echo "Failed to set password."
  fi
  ;;

4)
  echo "Delete user account"
  read -p "Enter username: " name
  if sudo userdel "$name"; then
    echo "User account deleted successfully."
  else
    echo "Failed to delete user account."
  fi
  ;;

5)
  echo "Current logged-in users:"
  who
  ;;

6)
  echo "Set or change user ID"
  read -p "Enter username: " name
  read -p "Enter new UID: " uid
  if sudo usermod -u "$uid" "$name"; then
    echo "User ID changed successfully."
  else
    echo "Failed to change user ID."
  fi
  ;;

7)
  echo "View user groups"
  read -p "Enter username: " name
  groups "$name"
  ;;

8)
  echo "Switch user account"
  read -p "Enter username to switch to: " name
  sudo su - "$name"
  ;;

9)
  echo "Lock user account"
  read -p "Enter username: " name
  if sudo usermod -L "$name"; then
    echo "User account locked successfully."
  else
    echo "Failed to lock user account."
  fi
  ;;

10)
  echo "Unlock user account"
  read -p "Enter username: " name
  if sudo usermod -U "$name"; then
    echo "User account unlocked successfully."
  else
    echo "Failed to unlock user account."
  fi
  ;;

11)
  echo "Add comment (full name)"
  read -p "Enter username: " name
  read -p "Enter full name/comment: " fullname
  if sudo usermod -c "$fullname" "$name"; then
    echo "Comment added successfully."
  else
    echo "Failed to add comment."
  fi
  ;;

12)
  echo "Change user home directory"
  read -p "Enter username: " name
  read -p "Enter new home directory path: " newdir
  if sudo usermod -d "$newdir" -m "$name"; then
    echo "Home directory changed successfully."
  else
    echo "Failed to change home directory."
  fi
  ;;

13)
  echo "Change user shell"
  read -p "Enter username: " name
  read -p "Enter new shell (e.g., /bin/bash): " shell
  if sudo usermod -s "$shell" "$name"; then
    echo "Shell changed successfully."
  else
    echo "Failed to change shell."
  fi
  ;;

14)
  echo "View user details"
  read -p "Enter username: " name
  getent passwd "$name"
  id "$name"
  lastlog -u "$name"
  ;;

15)
  echo "Set user account password policy"
  read -p "Enter username: " uname
  read -p "Enter max password age: " max
  read -p "Enter min password age: " min
  read -p "Enter warning days: " warn
  if sudo chage -M "$max" -m "$min" -W "$warn" "$uname"; then
    echo "Password policy set successfully."
  else
    echo "Failed to set password policy."
  fi
  ;;

*)
  echo "Invalid input. Please enter a number between 1 and 15."
  ;;
esac
done
