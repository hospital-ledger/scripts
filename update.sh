########################
# Author: Tom          #
# Version: 1.0         #
# Go: 1.13.4           #
# Nodejs: v8.9.4       #
# GCC: 7.3.0           #
# Fabric: 2.0.0        #
# Date: 2020-01-23 Thu #
# Descripiton: Update  #
# the yum for centos7. #
########################

# Scripts # --- start --- #

#!/bin/bash
echo -e "You need be root account and then you can do it."
echo -e "You can input 'su' and then input your key of root account to login with root account."
user=$(env | grep USER | cut -d "=" -f 2)
if [ "$user" == "root" ]
then echo "The user login with root account successfully. It will start."
else echo "You need to login with root account! Exit and then restart this script!"
exit
fi
#echo -e "Please input your key for root three seconds later."
#sleep 3
#echo -e "root login successfully."
yum update
yum upgrade
echo -e "yum upgrade successfully."
sleep 3
echo -e "Start install Python3 and Docker"
sleep 1
yum install wget
yum install curl
yum install python3
sleep 1
curl -fsSL https://get.docker.com/ | sh
docker -v
sleep 1
pip3 install docker-compose
docker-compose -v
sleep 1
echo -e "Start to set up the docker serve."
sleep 1
systemctl restart docker
groupadd docker
usermod -aG docker root
usermod -aG docker $user
gpasswd -a root docker
gpasswd -a $user docker
cat /etc/group | grep ^docker
systemctl restart docker
systemctl enable docker
systemctl restart docker
docker -v
echo -e "Prepare to do something for the environment."
sleep 1
chmod +777 ./*
sleep 1
yum install glibc-headers
yum install gcc-c++
echo -e "Well, all done."
