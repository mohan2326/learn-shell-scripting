#!/bin/bash

# colors
# ------------
# 31 --> red color
# 32 --> green
# 33 --> yellow

#synstax for color: \e[{colornumber}m
# \e[31m --> red color
# Output:
#     [ ec2-user@ip-172-31-27-208 ~ ]$ echo Hello World
#     Hello World
#     # 31m color - Red
#     [ ec2-user@ip-172-31-27-208 ~ ]$ echo -e "\e[31m Hello World"
#     Hello World
#     # 32m color - Green
#     [ ec2-user@ip-172-31-27-208 ~ ]$ echo -e "\e[32m Hello World"
#     Hello World
#     # 33m color - Yellow
#     [ ec2-user@ip-172-31-27-208 ~ ]$ echo -e "\e[33m Hello World"
#     Hello World
#     # 34m color - Blue
#     [ ec2-user@ip-172-31-27-208 ~ ]$ echo -e "\e[34m Hello World"
#     Hello World
#     # 35m color - Pink
#     [ ec2-user@ip-172-31-27-208 ~ ]$ echo -e "\e[35m Hello World"
#     Hello World
#     # here im printing 2 colors; hello in pink ; world in green
#     [ ec2-user@ip-172-31-27-208 ~ ]$ echo -e "\e[35m Hello \e[32m World"
#     Hello  World
#     # here im printing 4 colors; hello in pink ; world in green; aws in yellow ; linux in default
#     [ ec2-user@ip-172-31-27-208 ~ ]$ echo -e "\e[35m Hello \e[32m World \e[33m AWS \e[0m Linux"
#     Hello  World  AWS  Linux

#https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
Red="\e[31m"
Green="\e[32m"
Normal="\e[0m"

echo "Script started executing at: $TIMESTAMP"

VALIDATE(){
   if [ $1 -ne 0 ]
   then
        echo -e "$2...$Red FAILURE $Normal"
        exit 1
    else
        echo -e "$2...$Green SUCCESS $Normal"
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

dnf install dockerr -y &>>$LOGFILE
VALIDATE $? "Installing Docker"