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
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

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