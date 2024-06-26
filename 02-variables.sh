#!/bin/bash

#Lets assume converstion between to people 

# echo "Linux:: Hello SRE, How are you?"
# echo "SRE:: Hi Linux, I am fine. How are you?"
# echo "Linux: I am fine too. how is your work?"
# echo "SRE:: not bad. I am thinking to upgrade to DevOps"

# Output if the script
# --------
# [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 02-variables.sh
# Linux:: Hello SRE, How are you?
# SRE:: Hi Linux, I am fine. How are you?
# Linux: I am fine too. how is your work?
# SRE:: not bad. I am thinking to upgrade to DevOps


# In the above scenario we are repeating the users, so that case 
#     1. repeated words
#     2. if you want to change, you have to change it every where
#     3. while changing accidently you may change actual code


# Now I would like to delare through varibales:
# variables
# ------------
# int i=0, j=0

# i and j are variables

# x=0, y=1

# derive the formula, submit variables at last

# variables hold some values,


#Lets assume converstion between to people using the variabled

# PERSON1=Linux #no space between = and value
# PERSON2=SRE

# echo "$PERSON1:: Hello $PERSON2, How are you?"
# echo "$PERSON2:: Hi $PERSON1, I am fine. How are you?"
# echo "$PERSON1: I am fine too. how is your work?"
# echo "$PERSON2:: not bad. I am thinking to upgrade to DevOps"

# The output will be same with variables 

# Now lets assume to change the variables like PERSON1=TOM and PERSON2:JERRY
# In this case i will just update the variables

#declaring the variables
PERSON1=TOM #no space between = and value
PERSON2=JERRY

#referring variable
echo "$PERSON1:: Hello $PERSON2, How are you?"
echo "$PERSON2:: Hi $PERSON1, I am fine. How are you?"
echo "$PERSON1: I am fine too. how is your work?"
echo "$PERSON2:: not bad. I am thinking to upgrade to DevOps"

# Output had updated to our varibales:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 02-variables.sh
    # TOM:: Hello JERRY, How are you?
    # JERRY:: Hi TOM, I am fine. How are you?
    # TOM: I am fine too. how is your work?
    # JERRY:: not bad. I am thinking to upgrade to DevOps

#variable are central location to keep the values --> if you change variable value, it will be automaticaly reflected everywhere it is referred