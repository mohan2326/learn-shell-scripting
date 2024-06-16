#!/bin/bash

# How do you call other scripts from your shell script?
# -------------------------------------------
# 2 ways

# 1st way
# ------------
# ./<script-name>.sh

# variable values will not change after calling other script..
# PID of two scripts are different
# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 15-currest-script.sh
#     Before calling other script, course: DevOps from Current Script-1
#     Process ID of current shell script: 19838
#     Variable value from Other script: DevOps from Other Script-2
#     Process ID of other script: 19839
#     After calling other script, course: DevOps from Current Script-1


# 1. changes happened in other script will not affect current script
# 2. PID of 2 scripts are different

# 2nd way
# -------------
# source ./<script-name>.sh
# variable values changes after calling other script
# PID of 2 scripts are same...

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 15-currest-script.sh
#     Before calling other script, course: DevOps from Current Script-1
#     Process ID of current shell script: 19872
#     Variable value from Other script: DevOps from Other Script-2
#     Process ID of other script: 19872
#     After calling other script, course: DevOps from Other Script-2

# 1. changes happened in other script will be reflected in current script
# 2. PID of 2 scripts are same.


COURSE="DevOps from Current Script-1"

echo "Before calling other script, course: $COURSE"
echo "Process ID of current shell script: $$"

#./16-other-script.sh #1st way of calling script

source ./16-other-script.sh #2n way of calling script

echo "After calling other script, course: $COURSE"

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 15-currest-script.sh 
#     Before calling other script, course: DevOps from Current Script
#     Process ID of current shell script: 19776
#     After calling other script, course: DevOps from Current Script

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 15-currest-script.sh 
#     Before calling other script, course: DevOps from Current Script-1
#     Process ID of current shell script: 19814
#     15-currest-script.sh: line 32: ./16-other-script.sh: Permission denied
#     After calling other script, course: DevOps from Current Script-1