#!/bin/bash

# How do you call other scripts from your shell script?
# -------------------------------------------
# 2 ways

# 1st way
# ------------
# ./<script-name>.sh

# variable values will not change after calling other script..
# PID of two scripts are different

# 1. changes happened in other script will not affect current script
# 2. PID of 2 scripts are different

# 2nd way
# -------------
# source ./<script-name>.sh
# variable values changes after calling other script
# PID of 2 scripts are same...

# 1. changes happened in other script will be reflected in current script
# 2. PID of2 scripts are same.


COURSE="DevOps from Current Script"

echo "Before calling other script, course: $COURSE"
echo "Process ID of current shell script: $$"

#./16-other-script.sh

echo "After calling other script, course: $COURSE"
#echo "Process ID of current shell script: $$"