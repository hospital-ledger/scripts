########################
# Author: Tom          #
# Version:  - 1.0 -    #
# Date: 2020-01-23 Thu #
# Descripiton: We will #
# create a swap space  #
# for centos7. Well, t #
# his script can also  #
# run on other linux.  #
########################

#!/bin/bash
dd if=/dev/zero of=/root/swapfile bs=1M count=2000
mkswap /root/swapfile
swapon /root/swapfile

echo '/root/swapfile   swap   swap   default 0 0' >> /etc/fstab
free -m
swapon -s
echo "Please check the swapfile upsite, make sure they exist on this system and they work correctly."
