#!/bin/bash

# echo "Please enter username::"

# read USERNAME #here USERNAME IS variable

# echo "Please enter password::"

# read PASSWORD

# echo "Username is: $USERNAME, Password is: $PASSWORD"

# Output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 04-variable-confidential.sh
    # Please enter username::
    # admin
    # Please enter password::
    # pasword123
    # Username is: admin, Password is: pasword123

# --> Here if we see the password is showing, so we dont want to see it. At that time we use -s (this will not show)

echo "Please enter username::"

read -s USERNAME #here USERNAME is variable

echo "Please enter password::"

read -s PASSWORD

echo "Username is: $USERNAME, Password is: $PASSWORD"

# Output:
    # [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sh 04-variable-confidential.sh
    # Please enter username:: (in terminal what is value we are entering we are not seeing)
    # Please enter password:: (same as above)
    # Username is: admin, Password is: password (for tracking we are printing the output)


# confidential information
# -----------------------
# We want user to enter manually before execution
