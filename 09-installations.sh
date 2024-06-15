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
#     54.163.14.75 | 172.31.27.208 | t2.micro | https://github.com/mohan2326/learn-shell-scripting.git
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ id
#     uid=1001(ec2-user) gid=1001(ec2-user) groups=1001(ec2-user)

#     54.163.14.75 | 172.31.27.208 | t2.micro | https://github.com/mohan2326/learn-shell-scripting.git
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo su

#     54.163.14.75 | 172.31.27.208 | t2.micro | https://github.com/mohan2326/learn-shell-scripting.git
#     [ root@ip-172-31-27-208 /home/ec2-user/learn-shell-scripting ]# id
#     uid=0(root) gid=0(root) groups=0(root)

#     if id is 0 then super user, 
#     if not 0 then normal user

#     [ root@ip-172-31-27-208 /home/ec2-user/learn-shell-scripting ]# id -u
#     0

#     54.163.14.75 | 172.31.27.208 | t2.micro | https://github.com/mohan2326/learn-shell-scripting.git
#     [ root@ip-172-31-27-208 /home/ec2-user/learn-shell-scripting ]# exit
#     exit

#     54.163.14.75 | 172.31.27.208 | t2.micro | https://github.com/mohan2326/learn-shell-scripting.git
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ id -u
#     1001

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    #exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

dnf install mysql -y