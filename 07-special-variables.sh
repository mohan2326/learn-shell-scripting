#!/bin/bash

echo "All variables: $@" #Print all variables
#Output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 07-special-variables.sh devops aws
    # All variables: devops aws

echo "Number of variables passed: $#"
# output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 07-special-variables.sh devops aws
    # All variables: devops aws
    # Number of variables passed: 2


echo "Script Name: $0"
#output
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 07-special-variables.sh devops aws
    # All variables: devops aws
    # Number of variables passed: 2
    # Script Name: 07-special-variables.sh

echo "Current working directory: $PWD"
# output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 07-special-variables.sh devops aws
    # All variables: devops aws
    # Number of variables passed: 2
    # Script Name: 07-special-variables.sh
    # Current working directory: /home/ec2-user/learn-shell-scripting

echo "Home directory of current user: $HOME"
# output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 07-special-variables.sh devops aws
    # All variables: devops aws
    # Number of variables passed: 2
    # Script Name: 07-special-variables.sh
    # Current working directory: /home/ec2-user/learn-shell-scripting
    # Home directory of current user: /home/ec2-user

echo "Which user is running this script: $USER"
# output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 07-special-variables.sh devops aws
    # All variables: devops aws
    # Number of variables passed: 2
    # Script Name: 07-special-variables.sh
    # Current working directory: /home/ec2-user/learn-shell-scripting
    # Home directory of current user: /home/ec2-user
    # Which user is running this script: ec2-user

echo "Hostname: $HOSTNAME"
# output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 07-special-variables.sh devops aws
    # All variables: devops aws
    # Number of variables passed: 2
    # Script Name: 07-special-variables.sh
    # Current working directory: /home/ec2-user/learn-shell-scripting
    # Home directory of current user: /home/ec2-user
    # Which user is running this script: ec2-user
    # Hostname: ip-172-31-27-208.ec2.internal

echo "Process ID of the current shell script: $$"
# output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 07-special-variables.sh devops aws
    # All variables: devops aws
    # Number of variables passed: 2
    # Script Name: 07-special-variables.sh
    # Current working directory: /home/ec2-user/learn-shell-scripting
    # Home directory of current user: /home/ec2-user
    # Which user is running this script: ec2-user
    # Hostname: ip-172-31-27-208.ec2.internal
    # Process ID of the current shell script: 1831 #this is the process ID created by Linux

sleep 60 & #If you want investigate which process ID on the linux
# "&" is used to send the command to backgroud to check status
echo "Process ID of last background command: $!"
# output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 07-special-variables.sh devops aws
    # All variables: devops aws
    # Number of variables passed: 2
    # Script Name: 07-special-variables.sh
    # Current working directory: /home/ec2-user/learn-shell-scripting
    # Home directory of current user: /home/ec2-user
    # Which user is running this script: ec2-user
    # Hostname: ip-172-31-27-208.ec2.internal
    # Process ID of the current shell script: 1930
    # Process ID of last background command: 1931
    # #Backgroud command
    # [ ec2-user@ip-172-31-27-208 ~ ]$ ps -ef |grep sleep
    # ec2-user    1931       1  0 19:49 pts/0    00:00:00 sleep 60
    # ec2-user    1939    1880  0 19:49 pts/1    00:00:00 grep --color=auto sleep

echo "Exit status of previous command: $? "
# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 07-special-variables.sh devops aws
#     All variables: devops aws
#     Number of variables passed: 2
#     Script Name: 07-special-variables.sh
#     Current working directory: /home/ec2-user/learn-shell-scripting
#     Home directory of current user: /home/ec2-user
#     Which user is running this script: ec2-user
#     Hostname: ip-172-31-27-208.ec2.internal
#     Process ID of the current shell script: 14673
#     Process ID of last background command: 14674
#     Exit status of previous command: 0 