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

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +10)

echo "Files to delete: $FILES"

while IFS=read -r line
do
    echo "Deleting file: $line"
done <<< $FILES

#While loop
    # while IFS= read -r line
    # do
    #     statements to execute
    # done <<< input

#https://stackoverflow.com/questions/2983213/input-of-while-loop-to-come-from-output-of-command

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 18-delete-old-logs.sh 
#     Source directory exists 

# Output: (if you give folder does not exists)
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 18-delete-old-logs.sh 
#     Please make sure /tmp/app-logs1 exists 

# Output: (Command to create with previous dates)
#     54.163.14.75 | 172.31.27.208 | t2.micro | null
#     [ ec2-user@ip-172-31-27-208 /tmp/app-logs ]$ touch -d 20240102 sample

#     54.163.14.75 | 172.31.27.208 | t2.micro | null
#     [ ec2-user@ip-172-31-27-208 /tmp/app-logs ]$ ls -lrt
#     total 0
#     -rw-r--r-- 1 ec2-user ec2-user 0 Jan  2 00:00 sample

#     54.163.14.75 | 172.31.27.208 | t2.micro | null
#     [ ec2-user@ip-172-31-27-208 /tmp/app-logs ]$ touch -d 20240514 sample1

#     54.163.14.75 | 172.31.27.208 | t2.micro | null
#     [ ec2-user@ip-172-31-27-208 /tmp/app-logs ]$ touch -d 20240601 sample2

#     54.163.14.75 | 172.31.27.208 | t2.micro | null
#     [ ec2-user@ip-172-31-27-208 /tmp/app-logs ]$ ls -lrt
#     total 0
#     -rw-r--r-- 1 ec2-user ec2-user 0 Jan  2 00:00 sample
#     -rw-r--r-- 1 ec2-user ec2-user 0 May 14 00:00 sample1
#     -rw-r--r-- 1 ec2-user ec2-user 0 Jun  1 00:00 sample2

# Output: (filter logs by using find command)
#     [ ec2-user@ip-172-31-27-208 /tmp/app-logs ]$ find -name "*.log"
#     ./backend.log
#     ./frontend.log
#     ./mysql.log
#     (Filter logs for last 14 days)
#     54.163.14.75 | 172.31.27.208 | t2.micro | null
#     [ ec2-user@ip-172-31-27-208 /tmp/app-logs ]$ find -name "*.log" -mtime +14
#     ./mysql.log
#     (Filter logs last 10 days)
#     54.163.14.75 | 172.31.27.208 | t2.micro | null
#     [ ec2-user@ip-172-31-27-208 /tmp/app-logs ]$ find -name "*.log" -mtime +10
#     ./backend.log
#     ./frontend.log
#     ./mysql.log

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 18-delete-old-logs.sh 
#     Source directory exists 
#     Files to delete: /tmp/app-logs/backend.log
#     /tmp/app-logs/frontend.log
#     /tmp/app-logs/mysql.log