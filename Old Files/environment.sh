########################
# Author: Tom          #
# Version: 1.0         #
# Go: 1.13.4           #
# Nodejs: v8.9.4       #
# GCC: 7.3.0           #
# Fabric: 2.0.0        #
# Date: 2020-01-23 Thu #
# Descripiton: Environ #
# ment install scripts #
# for hyperledger fabr #
# ic 2.0.0 version.    #
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
yum install git
cd /opt
git clone https://github.com/hospital-ledger/environment.git
cd /opt/environment
cp ./go /opt
cp ./node-v8.9.4 /opt
cp ./gcc-7.3.0 /opt
cd /root
mkdir gopath
cd /opt
echo -e "Install go 1.13.4 now."
sleep 1
echo "" >> /etc/profile
echo "export GOROOT=/opt/go" >> /etc/profile
echo "export PATH=$PATH:$GOROOT/bin" >> /etc/profile
echo "export GOPATH=/root/gopath" >> /etc/profile
source /ect/profile
go version
sleep 10
cd /opt/gcc-7.3.0
./contrib/download_prerequisites
mkdir gcc-bulid-7.3.0
cd /opt/gcc-7.3.0/gcc-build-7.3.0
../configure -enable-checking=release -enable-languages=c,c++ -disable-multilib
make
make install
gcc -v
sleep 10
cd /usr/lib64
cp ./libstdc++.so.6.0.24 /usr/local/lib64
cd /usr/local/lib64
rm ./libstdc++.so.6
ln -s libstdc++.so6.0.24 libstdc++.so.6
cd /opt
cd /node-v8.9.4
./configure
make
make install
node -v
npm -v
sleep 10
echo -e "Please check with the code under this line."
echo -e "___________________________________________"
echo -e "go version"
echo -e "gcc -v"
echo -e "node -v"
echo -e "npm -v"
echo -e "___________________________________________"
echo -e "Please make sure they install successfully."
sleep 1
