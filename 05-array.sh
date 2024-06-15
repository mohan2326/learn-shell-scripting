#!/bin/bash

#For example considering these are in array format
TECHNOLOGIES=("AWS" "AZURE" "GCP") #list of values

#List always starts with 0 
#Size of above array is 3
#Index are 0,1,2

echo "First technology is: ${TECHNOLOGIES[0]}"
echo "Secont technology is: ${TECHNOLOGIES[1]}"
echo "Third technology is: ${TECHNOLOGIES[2]}"
echo "All technologies is: ${TECHNOLOGIES[@]}" #here @ is everything which will print all

# Output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 05-array.sh
    # First technology is: AWS
    # Secont technology is: AZURE
    # Third technology is: GCP
    # All technologies is: AWS AZURE GCP

# Data types
# ------------------
# integer (number)
# float (number)
# decimal (number)
# string (text)
# boolean --> true/false ... 1=true, 0=false
# array ()
# arraylist
# set, map

# array --> list of values
# if you define a variable as array, it can hold list of values...