#!/bin/bash

#declaring the variables --> using arguments/parameters
PERSON1=$1
PERSON2=$2

#referring variable
echo "$PERSON1:: Hello $PERSON2, How are you?"
echo "$PERSON2:: Hi $PERSON1, I am fine. How are you?"
echo "$PERSON1: I am fine too. how is your work?"
echo "$PERSON2:: not bad. I am thinking to upgrade to DevOps"

# Output:
# [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 03-variables-arguments.sh powerranger ninjastorm
# powerranger:: Hello ninjastorm, How are you?
# ninjastorm:: Hi powerranger, I am fine. How are you?
# powerranger: I am fine too. how is your work?
# ninjastorm:: not bad. I am thinking to upgrade to DevOps

#we can pass the arguments outside the script like above and passing in variable

# arguments/parameters
# --------------------
# sh variables.sh power ninja

# power = 1st variable
# ninja = 2nd variable
# .
# .
# .
# Some X = nth variable
