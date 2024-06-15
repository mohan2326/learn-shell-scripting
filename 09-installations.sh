#!/bin/bash

#dnf install mysql -y

# output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 09-installations.sh
    # Error: This command has to be run with superuser privileges (under the root user on most systems).

# installation
# ---------------
# if you want to install you should have super user access
# so check user
# if super user, proceed
# if not super user, I should throw proper error

# How you run a command inside shell script and take the output 
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ id
#     uid=1001(ec2-user) gid=1001(ec2-user) groups=1001(ec2-user)

#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo su

#     [ root@ip-172-31-27-208 /home/ec2-user/learn-shell-scripting ]# id
#     uid=0(root) gid=0(root) groups=0(root)

#     if id is 0 then super user, 
#     if not 0 then normal user

#     [ root@ip-172-31-27-208 /home/ec2-user/learn-shell-scripting ]# id -u
#     0

#     [ root@ip-172-31-27-208 /home/ec2-user/learn-shell-scripting ]# exit
#     exit

#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ id -u
#     1001

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "Installation of mysql...FAILURE"
    exit 1
else
    echo "Installation of mysql...SUCCESS"
fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo "Installation of git...FAILURE"
    exit 1
else
    echo "Installation of Git...SUCCESS"
fi

echo "is the script proceeding??"

# output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 09-installations.sh
    # Please run this script with root access.
    # Error: This command has to be run with superuser privileges (under the root user on most systems).

#if error comes, can we proceed? NO

# disadvantage of shell script
# ------------------------
# shell script will not stop even it faces the error, it is user responsibility to check the previous command is success/ or not

# exit status
# ------------
# what is exit status?
    # $? --> to check the exit status of previous command
    # 0 --> success
    # other than 0 --> failure
    # 1-127

#After putting the exit command the script had existed

    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 09-installations.sh
    # Please run this script with root access.

# output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo sh 09-installations.sh
    # You are super user.
    # Red Hat Enterprise Linux 9 for x86_64 - AppStream from RHUI (RPMs) 
    # Complete!
    # Installation of mysql...SUCCESS

# output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo sh 09-installations.sh
#     You are super user.
#     Last metadata expiration check: 0:01:41 ago on Sat Jun 15 20:24:05 2024.
#     Package mysql-8.0.36-1.el9_3.x86_64 is already installed.
#     Dependencies resolved.
#     Nothing to do.
#     Complete!
#     Installation of mysql...SUCCESS
#     Last metadata expiration check: 0:01:42 ago on Sat Jun 15 20:24:05 2024.
#     Package git-2.43.0-1.el9.x86_64 is already installed.
#     Dependencies resolved.
#     Nothing to do.
#     Complete!
#     Installation of Git...SUCCESS
#     is the script proceeding??

# In code we have to avoid using duplicates