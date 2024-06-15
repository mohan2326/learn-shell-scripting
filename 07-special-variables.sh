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

# echo "Home directory of current user: $HOME"
# echo "Which user is running this script: $USER"
# echo "Hostname: $HOSTNAME"
# echo "Process ID of the current shell script: $$"
# sleep 60 &
# echo "Process ID of last background command: $!"