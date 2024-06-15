#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 10 ]
then
    echo "Given number $NUMBER is greater than 10"
else
    echo "Given number $NUMBER is less than 10" 
fi

#-gt (greater than), -lt (less than), -eq (equal to), -ge (greathan equal), -le (lessthan equal)

#https://www.digitalocean.com/community/tutorials/if-else-in-shell-scripts

# Output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 08-conditions.sh 8
    # Given number 8 is less than 10

    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 08-conditions.sh 15
    # Given number 15 is greater than 10

#These are used as confitions:
    # if {

    # }
    # else {

    # }

# conditions
# ---------------
# when you want to take a decission

# I want to check whether a number is greater than 20 or not

# first get the number
# check if it is greater than 10 or not
# if greater print greater
# if lesser print lower

# if(expression){
# 	this statement will execute if expression is true
# }
# else{
# 	this statement will execute if expression is false
# }

# NUMBER=5
    # if(!NUMBER>10){
    # 	print "print given number is greater than 10"
    # }
    # else{
    # 	print "print given number is less than 10"
    # }

# NUMBER>10=false, !=false
# false false is true