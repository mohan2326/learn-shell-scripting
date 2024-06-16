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

while IFS= read -r line
do
    echo "Deleting file: $line"
    rm -rf $line
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

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 18-delete-old-logs.sh 
#     Source directory exists 
#     Files to delete: /tmp/app-logs/backend.log
#     /tmp/app-logs/frontend.log
#     /tmp/app-logs/mysql.log
#     Deleting file: /tmp/app-logs/backend.log
#     Deleting file: /tmp/app-logs/frontend.log
#     Deleting file: /tmp/app-logs/mysql.log

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 18-delete-old-logs.sh 
#     Source directory exists 
#     Files to delete: /tmp/app-logs/backend.log
#     /tmp/app-logs/frontend.log
#     /tmp/app-logs/mysql.log
#     Deleting file: /tmp/app-logs/backend.log
#     Deleting file: /tmp/app-logs/frontend.log
#     Deleting file: /tmp/app-logs/mysql.log

#     54.163.14.75 | 172.31.27.208 | t2.micro | https://github.com/mohan2326/learn-shell-scripting.git
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ cd /tmp/app-logs/

#     54.163.14.75 | 172.31.27.208 | t2.micro | null
#     [ ec2-user@ip-172-31-27-208 /tmp/app-logs ]$ ls -lrt
#     total 0
#     -rw-r--r-- 1 ec2-user ec2-user 0 Jun  5 00:00 script01.java

# logs
# ---------
# 1. everyday a new logfile will be created with that date.

# rotate the logs
# 2. zip them and transfer to other servers

# crontab --> a scheduler for linux servers

# crontab -e --> edit crontab

# 5 4 * * *

# 1-M
# 2-TUE
# 3-WED
# 4-THU
# 5-FRI
# 6-SAT
# 0-SUN

# zip the files and move another location in linux server...

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ crontab -e
#     crontab: installing new crontab

#     54.163.14.75 | 172.31.27.208 | t2.micro | https://github.com/mohan2326/learn-shell-scripting.git
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ crontab -l
#     */2 * * * * sh /home/ec2-user/learn-shell-scripting/18-delete-old-logs.sh 

#     54.163.14.75 | 172.31.27.208 | t2.micro | https://github.com/mohan2326/learn-shell-scripting.git
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo su

#     54.163.14.75 | 172.31.27.208 | t2.micro | https://github.com/mohan2326/learn-shell-scripting.git
#     [ root@ip-172-31-27-208 /home/ec2-user/learn-shell-scripting ]# cd /var/log/

#     54.163.14.75 | 172.31.27.208 | t2.micro | null
#     [ root@ip-172-31-27-208 /var/log ]# tail -f cron
#     Jun 16 07:21:46 ip-172-31-27-208 crontab[20471]: (ec2-user) BEGIN EDIT (ec2-user)
#     Jun 16 07:22:01 ip-172-31-27-208 CROND[20474]: (ec2-user) CMD (sh )
#     Jun 16 07:22:01 ip-172-31-27-208 CROND[20473]: (ec2-user) CMDEND (sh )
#     Jun 16 07:22:18 ip-172-31-27-208 crontab[20471]: (ec2-user) REPLACE (ec2-user)
#     Jun 16 07:22:18 ip-172-31-27-208 crontab[20471]: (ec2-user) END EDIT (ec2-user)
#     Jun 16 07:22:24 ip-172-31-27-208 crontab[20479]: (ec2-user) BEGIN EDIT (ec2-user)
#     Jun 16 07:22:42 ip-172-31-27-208 crontab[20479]: (ec2-user) REPLACE (ec2-user)
#     Jun 16 07:22:42 ip-172-31-27-208 crontab[20479]: (ec2-user) END EDIT (ec2-user)
#     Jun 16 07:22:47 ip-172-31-27-208 crontab[20484]: (ec2-user) LIST (ec2-user)
#     Jun 16 07:23:01 ip-172-31-27-208 crond[1246]: (ec2-user) RELOAD (/var/spool/cron/ec2-user)
#     Jun 16 07:24:01 ip-172-31-27-208 CROND[20532]: (ec2-user) CMD (sh /home/ec2-user/learn-shell-scripting/18-delete-old-logs.sh )
#     Jun 16 07:24:01 ip-172-31-27-208 CROND[20531]: (ec2-user) CMDOUT (#033[32m Source directory exists #033[0m)
#     Jun 16 07:24:01 ip-172-31-27-208 CROND[20531]: (ec2-user) CMDOUT (Files to delete: /tmp/app-logs/frontend.log)
#     Jun 16 07:24:01 ip-172-31-27-208 CROND[20531]: (ec2-user) CMDOUT (/tmp/app-logs/backend.log)
#     Jun 16 07:24:01 ip-172-31-27-208 CROND[20531]: (ec2-user) CMDOUT (/tmp/app-logs/mysql.log)
#     Jun 16 07:24:01 ip-172-31-27-208 CROND[20531]: (ec2-user) CMDOUT (Deleting file: /tmp/app-logs/frontend.log)
#     Jun 16 07:24:01 ip-172-31-27-208 CROND[20531]: (ec2-user) CMDOUT (Deleting file: /tmp/app-logs/backend.log)
#     Jun 16 07:24:01 ip-172-31-27-208 CROND[20531]: (ec2-user) CMDOUT (Deleting file: /tmp/app-logs/mysql.log)
#     Jun 16 07:24:01 ip-172-31-27-208 CROND[20531]: (ec2-user) CMDEND (sh /home/ec2-user/learn-shell-scripting/18-delete-old-logs.sh )
