#!/bin/bash

# variables
# data types
# conditions
# functions
# loops

# functions
# -----------
# it is block of code that can do some work. It accepts inputs too... this used if your using repeating the name in the shell script

    # FUNC_NAME(){

    # }

    # FUNC_NAME

# variable:
#    any value repeated inside code can be declared as a variable. declaring variables is a best practice even it is repeating only 1 time.

# similary if a a block code is repeating, consider using functions..

# Modifying the same code used the installtions with funtions:

USERID=$(id -u)

VALIDATE(){
    echo "Exit status: $1"
    echo "What are you doing: $2"
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

dnf install mysql -y
VALIDATE $? "Installing MySQL"

dnf install git -y
VALIDATE $? "Installing GIT"