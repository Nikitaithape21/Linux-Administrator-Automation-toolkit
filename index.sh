            #!/bin/bash


clear
while true; do
echo "========================"
echo "    Linux Server Admin  Tasks "
echo "========================"
echo "1. Linux Server Monitoring"
echo "2. Resource Management"
echo "3. User Management"
echo "4. Permission Management"
echo "5. Group Management"
echo "6. File Management"
echo "7. Directory Management"
echo "8. Process Management"
echo "9. Disk Space Management"
echo "10. Log File Management"
echo "11. Backup Management"
echo "12. Job Schedule and Management"
echo "13. Exit"
echo "========================"
echo -n "Enter your choice (1-13): " resoures.sh
read choice


case $choice in
    1) ./server.sh ;;
    2) ./ resoures.sh  ;;
    3) ./user.sh ;;
    4) ./ permissions.sh ;;
    5) ./group.sh ;;
    6) ./file.sh ;;
    7) ./dir.sh ;;
    8) ./process.sh ;;
    9) ./disk.sh ;;
    10) ./log.sh ;;
    11) ./backup.sh ;;
    12) ./job.sh ;;
    13) echo "Exiting..."; exit 0 ;;
    *) echo "Invalid option! Please run the script again with a valid option." ;;
esac
done

