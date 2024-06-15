#!/bin/bash

# loops
# -----------
# for(int i=0; i<20; i++){
# 	print $i;
# }

#https://stackoverflow.com/questions/1445452/shell-script-for-loop-syntax

for i in {1..20} # it will loop from 1 to 20
do
    echo $i
done

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 13-loops.sh
#     1
#     2
#     3
#     4
#     5
#     6
#     7
#     8
#     9
#     10
#     11
#     12
#     13
#     14
#     15
#     16
#     17
#     18
#     19
#     20