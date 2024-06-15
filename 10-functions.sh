#!/bin/bash

# variables
# data types
# conditions
# functions
# loops

# functions
# -----------
# it is block of code that can do some work. It accepts inputs too... this used if your using repeating the name in the shell script

    # FUNC_NAME(){

    # }

    # FUNC_NAME

# variable:
#    any value repeated inside code can be declared as a variable. declaring variables is a best practice even it is repeating only 1 time.

# similary if a a block code is repeating, consider using functions..

# Modifying the same code used the installtions with funtions:

# USERID=$(id -u)

# VALIDATE(){
#     echo "Exit status: $1"
#     echo "What are you doing: $2"
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

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo sh 10-functions.sh
#     You are super user.
#     Last metadata expiration check: 0:21:03 ago on Sat Jun 15 20:24:05 2024.
#     Package mysql-8.0.36-1.el9_3.x86_64 is already installed.
#     Dependencies resolved.
#     Nothing to do.
#     Complete!
#     Exit status: 0 (#Based on this will write the success and failure)
#     What are you doing: Installing MySQL
#     Last metadata expiration check: 0:21:04 ago on Sat Jun 15 20:24:05 2024.
#     Package git-2.43.0-1.el9.x86_64 is already installed.
#     Dependencies resolved.
#     Nothing to do.
#     Complete!
#     Exit status: 0 (#Based on this will write the success and failure)
#     What are you doing: Installing GIT

USERID=$(id -u)

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

dnf install mysql -y
VALIDATE $? "Installing MySQL"

dnf install git -y
VALIDATE $? "Installing GIT"

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo sh 10-functions.sh
#     You are super user.
#     Last metadata expiration check: 0:25:21 ago on Sat Jun 15 20:24:05 2024.
#     Package mysql-8.0.36-1.el9_3.x86_64 is already installed.
#     Dependencies resolved.
#     Nothing to do.
#     Complete!
#     Installing MySQL...SUCCESS
#     Last metadata expiration check: 0:25:22 ago on Sat Jun 15 20:24:05 2024.
#     Package git-2.43.0-1.el9.x86_64 is already installed.
#     Dependencies resolved.
#     Nothing to do.
#     Complete!
#     Installing GIT...SUCCESS