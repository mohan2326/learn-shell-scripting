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
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

for i in $@
do 
    echo "packages to install: $i"
done