#!/bin/bash

# delete old logs
# ---------------
# cd /app/logs
# 	daily 1 log file

# delete old log files more than 2 weeks old...

# 1. decide which folder, check that folder exist or not
# 2. .java, .sh, .py, .log files are there in that folder (you can't delete these files)
# 3. find only .log files
# 4. find only more than 2 weeks old

#https://www.cyberciti.biz/faq/check-if-a-directory-exists-in-linux-or-unix-shell/

SOURCE_DIRECTORY=/tmp/app-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIRECTORY ]
then
    echo -e "$G Source directory exists $N"
else
    echo -e "$R Please make sure $SOURCE_DIRECTORY exists $N"
    exit 1
fi

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 18-delete-old-logs.sh 
#     Source directory exists 

# Output: (if you give folder does not exists)
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 18-delete-old-logs.sh 
#     Please make sure /tmp/app-logs1 exists 