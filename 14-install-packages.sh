#/bin/bash

# Package: 
#     mysql
#     gcc
#     chrony
#     fail2ban
#     postgis2_94

# steps
# -----------
# log redirection
# colors are mandatory

# 1. user have root access or not
# 2. send packages to install as parameters
# sudo sh install-packages mysql gcc docker 

# special variable to get all params --> $@

# USERID=$(id -u)
# if [ $USERID -ne 0 ]
# then
#     echo "Please run this script with root access."
#     exit 1 # manually exit if error comes.
# else
#     echo "You are super user."
# fi

# echo "All packages: $@"

# Output: 
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo sh 14-install-packages.sh
#     You are super user.
#     All packages: 

#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo sh 14-install-packages.sh mysql gcc chrony
#     You are super user.
#     All packages: mysql gcc chrony

#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$


# Now giving the packages in loops:
# USERID=$(id -u)
# if [ $USERID -ne 0 ]
# then
#     echo "Please run this script with root access."
#     exit 1 # manually exit if error comes.
# else
#     echo "You are super user."
# fi

# for i in $@
# do 
#     echo "packages to install: $i"
#     dnf list installed $i
# done

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo sh 14-install-packages.sh mysql gcc chrony fail2ban
#     You are super user.
#     packages to install: mysql
#     packages to install: gcc
#     packages to install: chrony
#     packages to install: fail2ban

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo sh 14-install-packages.sh mysql gcc chrony fail2ban
#     You are super user.
#     packages to install: mysql
#     Installed Packages
#     mysql.x86_64                                                                     8.0.36-1.el9_3                                                                     @rhel-9-appstream-rhui-rpms
#     packages to install: gcc
#     Installed Packages
#     gcc.x86_64                                                                       11.4.1-3.el9                                                                       @rhel-9-appstream-rhui-rpms
#     packages to install: chrony
#     Installed Packages
#     chrony.x86_64                                                                                 4.3-1.el9                                                                                 @System
#     packages to install: fail2ban
#     Error: No matching Packages to list

#Now putting the timestamp; exit status; log file; validate

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m" #R = Red
G="\e[32m" #G = Green
Y="\e[33m" #Y = Yellow
N="\e[0m"  #N = Normal

VALIDATE(){
   if [ $1 -ne 0 ]
   then
        echo -e "$2...$R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

for i in $@
do
    echo "package to install: $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo -e "$i already installed...$Y SKIPPING $N"
    else
        dnf install $i -y &>>$LOGFILE
        VALIDATE $? "Installation of $i"
    fi
done

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo sh 14-install-packages.sh mysql gcc chrony fail2ban
#     You are super user.
#     package to install: mysql
#     Installation of mysql... SUCCESS 
#     package to install: gcc
#     Installation of gcc... SUCCESS 
#     package to install: chrony
#     Installation of chrony... SUCCESS 
#     package to install: fail2ban
#     fail2ban already installed... SKIPPING 
#     [ ec2-user@ip-172-31-27-208 /tmp ]$ ls -lrt #checking the log files
#     total 32
#     drwx------ 3 root root   60 Jun 15 18:46 systemd-private-abe2ab3f02a841e6998281dbd925de10-dbus-broker.service-YyZHle
#     drwx------ 3 root root   60 Jun 15 18:46 systemd-private-abe2ab3f02a841e6998281dbd925de10-systemd-logind.service-tDfGao
#     -rw-r--r-- 1 root root  354 Jun 15 21:22 11-logs-2024-06-15-21-22-05.log
#     -rw-r--r-- 1 root root 2504 Jun 15 21:43 12-log-colors-2024-06-15-21-43-24.log
#     -rw-r--r-- 1 root root  497 Jun 15 21:45 12-log-colors-2024-06-15-21-45-22.log
#     -rw-r--r-- 1 root root 4987 Jun 15 22:11 14-install-packages-2024-06-15-22-11-35.log
#     -rw-r--r-- 1 root root 9515 Jun 15 22:12 14-install-packages-2024-06-15-22-12-27.log