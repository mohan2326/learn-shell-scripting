#!/bin/bash

# logs
# ------
# we should persist/store the logs of any coding, this is the best practice.



# #Commands used to get the date till seconds
#     -> date
#     -> date +%F (Date with formmat)
#     -> date +%F-%H (%H is used to get the hour)
#     -> date +%F-%H-%M (%M is used to get the minute)
#     -> date +%F-%H-%M-%S (%S is used to get the seconds)

#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ date
#     Sat Jun 15 20:52:47 UTC 2024

#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ date +%F
#     2024-06-15

#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ date +%F-%H
#     2024-06-15-20

#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ date +%F-%H-%M
#     2024-06-15-20-55

#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ date +%F-%H-%M-%S
#     2024-06-15-20-55-40 


# USERID=$(id -u)
# TIMESTAMP=$(date +%F-%H-%M-%S)
# SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
# LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

# VALIDATE(){
#    if [ $1 -ne 0 ]
#    then
#         echo "$2...FAILURE"
#         exit 1
#     else
#         echo "$2...SUCCESS"
#     fi
# }

# if [ $USERID -ne 0 ]
# then
#     echo "Please run this script with root access."
#     exit 1 # manually exit if error comes.
# else
#     echo "You are super user."
# fi

# dnf install mysql -y
# VALIDATE $? "Installing MySQL"

# dnf install git -y
# VALIDATE $? "Installing GIT"


# Redirections
# # ----------
#     # > --> by default only success output will be redirected...
#         [ ec2-user@ip-172-31-27-208 ~ ]$ ls -l > output.log
#         [ ec2-user@ip-172-31-27-208 ~ ]$ cat output.log
#         total 4
#         drwxr-xr-x 3 ec2-user ec2-user 4096 Jun 15 20:49 learn-shell-scripting
#         -rw-r--r-- 1 ec2-user ec2-user    0 Jun 15 21:09 output.log
#     # 1 --> success
#         -bash: fhfhhjk: command not found
#     # 2 --> Error
#         [ ec2-user@ip-172-31-27-208 ~ ]$ fhfhhjk 2> output.log
#         [ ec2-user@ip-172-31-27-208 ~ ]$ cat output.log
#         -bash: fhfhhjk: command not found
#     # & --> Both success and error 
#         [ ec2-user@ip-172-31-27-208 ~ ]$ fhfhhjk &> output.log
#         [ ec2-user@ip-172-31-27-208 ~ ]$ cat output.log
#         -bash: fhfhhjk: command not found
#         [ ec2-user@ip-172-31-27-208 ~ ]$ ls -l &> output.log
#         [ ec2-user@ip-172-31-27-208 ~ ]$ cat output.log
#         total 4
#         drwxr-xr-x 3 ec2-user ec2-user 4096 Jun 15 20:49 learn-shell-scripting
#         -rw-r--r-- 1 ec2-user ec2-user    0 Jun 15 21:13 output.log
#     # >> --> append ;there should be no space b/w & and > ; it shoud be like this &>>
#         [ ec2-user@ip-172-31-27-208 ~ ]$ ls -l &>> output.log
#         [ ec2-user@ip-172-31-27-208 ~ ]$ cat output.log
#         -bash: fhfhhjk: command not found
#         total 8
#         drwxr-xr-x 3 ec2-user ec2-user 4096 Jun 15 20:49 learn-shell-scripting
#         -rw-r--r-- 1 ec2-user ec2-user   34 Jun 15 21:14 output.log

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE(){
   if [ $1 -ne 0 ]
   then
        echo "$2...FAILURE"
        exit 1
    else
        echo "$2...SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing MySQL"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing Git"