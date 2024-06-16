#!/bin/bash

# disadvantage
# -------------
# script will not exit even error comes...

# set -e --> script starting

# some cases --> even error comes, it should move forward --> error handling

# set -e

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