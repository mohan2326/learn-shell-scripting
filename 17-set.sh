#!/bin/bash

# disadvantage
# -------------
# script will not exit even error comes...

# set -e --> script starting

# some cases --> even error comes, it should move forward --> error handling

set -e

# failure(){
#     echo "Failed at $1: $2"
# }

# trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u) #ERR

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

dnf install mysfaffql -y
dnf install git -y

echo "is script proceeding?"

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo sh 17-set.sh 
#     You are super user.
#     Last metadata expiration check: 2:15:01 ago on Sun Jun 16 03:31:29 2024.
#     No match for argument: mysfaffql
#     Error: Unable to find a match: mysfaffql
#     Last metadata expiration check: 2:15:03 ago on Sun Jun 16 03:31:29 2024.
#     Package git-2.43.0-1.el9.x86_64 is already installed.
#     Dependencies resolved.
#     Nothing to do.
#     Complete!
#     is script proceeding?