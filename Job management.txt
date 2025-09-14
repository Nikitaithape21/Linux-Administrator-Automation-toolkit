#!/bin/bash
clear
while true; do
echo "------------------------  Welcome To Job Scheduling & Management Module  ------------------------"
echo "Please select the option:"
echo "  1  : Schedule a new job"
echo "  2  : List scheduled jobs"
echo "  3  : Edit a scheduled job"
echo "  4  : Remove a scheduled job"
echo "  5  : View system cron log"
echo "  6  : View current user's cron jobs"
echo "  7  : Backup cron jobs"
echo "  8  : Restore cron jobs"
echo "--------------------------------------------------------------------------------------------"
read -p "Please enter the option between 1 to 8: " jobchoice
echo "You have selected option $jobchoice"
echo "--------------------------------------------------------------------------------------------"

case $jobchoice in
  1)
    echo "Scheduling a new job"
    read -p "Enter the cron schedule (e.g., '0 5 * * *' for 5 AM every day): " cron_schedule
    read -p "Enter the command to execute: " cron_command
    # Add the cron job to the crontab file
    (crontab -l ; echo "$cron_schedule $cron_command") | crontab -
    echo "Job scheduled successfully with the following schedule: $cron_schedule"
    ;;
  2)
    echo "Listing all scheduled jobs:"
    crontab -l
    ;;
  3)
    echo "Editing a scheduled job"
    crontab -e
    ;;
  4)
    echo "Removing a scheduled job"
    read -p "Enter the job's cron schedule to remove: " cron_schedule
    crontab -l | grep -v "$cron_schedule" | crontab -
    echo "Job with schedule '$cron_schedule' removed successfully"
    ;;
  5)
    echo "Viewing system cron log (requires sudo)"
    sudo cat /var/log/syslog | grep CRON
    ;;
  6)
    echo "Viewing current user's cron jobs"
    crontab -l
    ;;
  7)
    echo "Backing up current cron jobs"
    crontab -l > backup_cron_jobs.txt
    echo "Cron jobs backed up to backup_cron_jobs.txt"
    ;;
  8)
    echo "Restoring cron jobs from backup"
    read -p "Enter the backup file (e.g., backup_cron_jobs.txt): " backup_file
    if [[ -f "$backup_file" ]]; then
      crontab "$backup_file"
      echo "Cron jobs restored successfully from '$backup_file'"
    else
      echo "Backup file not found!"
    fi
    ;;
  *)
    echo "Invalid input. Please select a valid option between 1 to 8."
    ;;
esac
done

