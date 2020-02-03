########################
# Author: Tom          #
# Version: 3.0         #
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

cd /opt
if [ ! -d "/opt/environment" ]; then
    git clone https://github.com/hospital-ledger/environment.git
    else echo -e "The repository has been download, maybe you need to check the version of it."
fi
cd /opt/environment
echo -e "Let's copy the necessary files to the system."
if [ ! -d "/opt/go" ]; then
    cp -r -f ./go /opt
    else echo -e "Directory go has been existed."
fi
if [ ! -d "/opt/node-v8.9.4" ]; then
    cp -r -f ./node-v8.9.4 /opt
    else echo -e "Directory node has been existed."
fi
if [ ! -d "/opt/gcc-7.3.0" ]; then
    cp -r -f ./gcc-7.3.0 /opt
    else echo -e "Directory gcc has been existed."
fi
cd /root
if [ ! -d "gopath" ]; then
    mkdir gopath
fi
cd /opt
echo -e "Install go 1.13.4 now."
sleep 1
echo "" >> /etc/profile
echo "export GOROOT=/opt/go" >> /etc/profile
echo "export PATH=\$PATH:\$GOROOT/bin" >> /etc/profile
echo "export GOPATH=/root/gopath" >> /etc/profile
source /etc/profile
go version
sleep 10
echo -e "Well, let's install the GCC, it may cost a lot of time."
echo -e "Maybe..."
sleep 1 
echo -e "Two hours."
cd /opt/gcc-7.3.0
./contrib/download_prerequisites
if [ ! -d "gcc-build-7.3.0" ]; then
    mkdir gcc-build-7.3.0
    #else rm -r -f gcc-build-7.3.0
    mkdir gcc-build-7.3.0
fi
cd /opt/gcc-7.3.0/gcc-build-7.3.0
../configure -enable-checking=release -enable-languages=c,c++ -disable-multilib
make
make install
gcc -v
sleep 1
cd /usr/local/lib64
cp -r -f ./libstdc++.so.6.0.24 /usr/lib64
cd /usr/lib64
rm ./libstdc++.so.6
ln -s ./libstdc++.so.6.0.24 libstdc++.so.6
cd /opt
cd /opt/node-v8.9.4
./configure
make
make install
node -v
npm -v
sleep 10
echo -e "Please check with the code under this line."
echo -e "___________________________________________"
echo -e "|go version                               |"
echo -e "|gcc -v                                   |"
echo -e "|node -v                                  |"
echo -e "|npm -v                                   |"
echo -e "|_________________________________________|"
echo -e "Please make sure they install successfully."
sleep 1
