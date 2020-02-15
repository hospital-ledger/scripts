###################################################
#_________________________________________________#
#|                                               |#
#| The fast setup of Hospital-ledger network.    |#
#|                                               |#
#| This scripts will use the Version-3.0.        |#
#| With Fabric 2.0.0 Go1.13.4 Nodejs v8.94       |#
#|                                               |#
#| Docker images version: 2.0 1.4 and 0.4.18     |#
#|                                               |#
#| Install environment: CentOS 7 x86_64 50G/2G   |#
#|                                               |#
#| Medical Data Blockchain Services Platform.    |#
#| Nankai University 2020 © All Right Reserved.  |#
#|_______________________________________________|#
###################################################

#!/bin/bash
latest="Version-3.0"

echo -e "You need be root account and then you can do it."
echo -e "You can input 'su' and then input your key of root account to login with root account."
user=$(whoami)
if [ "$user" == "root" ];
then echo "The user login with root account successfully. It will start."
else echo "You need to login with root account! Exit and then restart this script!"
exit
fi
echo -e "You are $user"

if [ ! -d "/opt/scripts" ]; then
    git clone https://github.com/hospital-ledger/scripts.git
fi
swapdisk=$(swapon)
if [ "$swapdisk" == "" ]; then
    cd /opt/scripts
    git checkout master
    chmod +777 ./*
    ./swap.sh
fi
if [ -d "/opt/scripts" ]; then
    result=$(git checkout $latest)
    if [ "$result" == "Already on '$latest'" ]; then
        echo -e "All right. Let's start"
        else cd /opt
        rm -f -r scripts
        git clone https://github.com/hospital-ledger/scripts.git
        cd /opt/scripts
        git checkout $latest
        echo -e "Well, all done."
    fi
fi
cd /opt/scripts/
chmod +777 ./*
./first.sh
(./second.sh && ./final.sh) & ./download.sh >> /opt/ImagesLog.txt
echo "Please check the packages which need to be installed."
