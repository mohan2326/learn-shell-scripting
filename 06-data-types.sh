#!/bin/bash

#Addition of two number using arthemation orperators (+, -, *, / , %)

NO1=$1
NO2=$2

SUM=$(($NO1+$NO2)) # the sysbol '$' will treat as expression

echo "Total of $NO1 and $NO2 is: $SUM"

#https://www.tutorialspoint.com/unix/unix-basic-operators.htm

# Output:
    # sh 06-data-types.sh 110 50
    # Total of 110 and 50 is: 160
