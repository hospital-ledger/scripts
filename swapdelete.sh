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

swapoff /root/swapfile
rm -f /root/swapfile
if [ ! -f "/root/swapfile" ]; then
	echo "Well, all done."
else echo "Error, please search on the Internet and then deal with these issues."
fi
