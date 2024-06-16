#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=6

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1 )
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        #echo "$FOLDER is more than $DISK_THRESHOLD, Current usage: $USAGE"
        MESSAGE+="$FOLDER is more than $DISK_THRESHOLD, Current usage: $USAGE \n"
    fi
done <<< $DISK_USAGE

echo -e "Message: $MESSAGE"

echo "$MESSAGE" | mail -s "Disk Usage Alert" mohanv3838@gmail.com
#To send in mail:

# Output:
#     [ ec2-user@ip-172-31-27-208 ~/learn-shell-scripting ]$ sudo sh 19-disk-usag.sh
#     / is more than 6, Current usage: 33
#     /var is more than 6, Current usage: 17
#     /boot is more than 6, Current usage: 53

# # Output: 
#     [ root@ip-172-31-27-208 ~ ]# df -h (Disk Usage)
#     Filesystem                    Size  Used Avail Use% Mounted on
#     devtmpfs                      4.0M     0  4.0M   0% /dev
#     tmpfs                         377M     0  377M   0% /dev/shm
#     tmpfs                         151M  2.5M  149M   2% /run
#     /dev/mapper/RootVG-rootVol    6.0G  2.0G  4.1G  33% /
#     tmpfs                         377M  4.3M  373M   2% /tmp
#     /dev/mapper/RootVG-homeVol    960M   42M  919M   5% /home
#     /dev/mapper/RootVG-varVol     2.0G  323M  1.7G  17% /var
#     /dev/mapper/RootVG-logVol     2.0G   73M  1.9G   4% /var/log
#     /dev/mapper/RootVG-varTmpVol  2.0G   47M  1.9G   3% /var/tmp
#     /dev/mapper/RootVG-auditVol   4.4G   65M  4.3G   2% /var/log/audit
#     /dev/xvda3                    424M  223M  202M  53% /boot
#     /dev/xvda2                    122M  7.0M  115M   6% /boot/efi
#     tmpfs                          76M     0   76M   0% /run/user/1001

#     [ root@ip-172-31-27-208 ~ ]# df -hT (Disk Usage with Type)
#     Filesystem                   Type      Size  Used Avail Use% Mounted on
#     devtmpfs                     devtmpfs  4.0M     0  4.0M   0% /dev
#     tmpfs                        tmpfs     377M     0  377M   0% /dev/shm
#     tmpfs                        tmpfs     151M  2.5M  149M   2% /run
#     /dev/mapper/RootVG-rootVol   xfs       6.0G  2.0G  4.1G  33% /
#     tmpfs                        tmpfs     377M  4.3M  373M   2% /tmp
#     /dev/mapper/RootVG-homeVol   xfs       960M   42M  919M   5% /home
#     /dev/mapper/RootVG-varVol    xfs       2.0G  323M  1.7G  17% /var
#     /dev/mapper/RootVG-logVol    xfs       2.0G   73M  1.9G   4% /var/log
#     /dev/mapper/RootVG-varTmpVol xfs       2.0G   47M  1.9G   3% /var/tmp
#     /dev/mapper/RootVG-auditVol  xfs       4.4G   65M  4.3G   2% /var/log/audit
#     /dev/xvda3                   xfs       424M  223M  202M  53% /boot
#     /dev/xvda2                   vfat      122M  7.0M  115M   6% /boot/efi
#     tmpfs                        tmpfs      76M     0   76M   0% /run/user/1001

#     [ root@ip-172-31-27-208 ~ ]# free ( used to get RAM Used)
#                 total        used        free      shared  buff/cache   available
#     Mem:          772072      221552      346936        6328      317500      550520
#     Swap:        2097148       40704     2056444

#     [ root@ip-172-31-27-208 ~ ]# free -m (used to get to mb)
#                 total        used        free      shared  buff/cache   available
#     Mem:             753         216         338           6         310         537
#     Swap:           2047          39        2008

#     Moinitor XFS File system
#     [ root@ip-172-31-27-208 ~ ]# df -hT | grep xfs
#     /dev/mapper/RootVG-rootVol   xfs       6.0G  2.0G  4.1G  33% /
#     /dev/mapper/RootVG-homeVol   xfs       960M   42M  919M   5% /home
#     /dev/mapper/RootVG-varVol    xfs       2.0G  323M  1.7G  17% /var
#     /dev/mapper/RootVG-logVol    xfs       2.0G   73M  1.9G   4% /var/log
#     /dev/mapper/RootVG-varTmpVol xfs       2.0G   47M  1.9G   3% /var/tmp
#     /dev/mapper/RootVG-auditVol  xfs       4.4G   65M  4.3G   2% /var/log/audit
#     /dev/xvda3                   xfs       424M  223M  202M  53% /boot

#     Show the % used
#     [ root@ip-172-31-27-208 ~ ]# df -hT | grep xfs | awk -F " " '{print $6F}'
#     33%
#     5%
#     17%
#     4%
#     3%
#     2%
#     53%

#     Removing the % from the output
#     [ root@ip-172-31-27-208 ~ ]# df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1
#     33
#     5
#     17
#     4
#     3
#     2
#     53

#     Getting the File system used
#     [ root@ip-172-31-27-208 ~ ]# df -hT | grep xfs | awk -F " " '{print $NF}'
#     /
#     /home
#     /var
#     /var/log
#     /var/tmp
#     /var/log/audit
#     /boot