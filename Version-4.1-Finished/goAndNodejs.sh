# Setup the go1.13.4 and Node.js-v8.9.4 with npm 5.6.0.
# | - Version-4.0 - |
#!/bin/bash

name="goAndNodejs.sh"
timestamp=$(date)
# Judge the account of the user.
mkdir /opt/install-log
echo -e "You need be root account and then you can do it."
echo -e "You can input 'su' and then input your key of root account to login with root account."
user=$(whoami)
echo "$user try to run the script $name at $timestamp." >> /opt/install-log/operations.txt
if [ "$user" == "root" ];
then echo "The user login with root account successfully. It will start."
else echo "You need to login with root account! Exit and then you can restart this script!"
     echo "$user failed to run the scripts $name at $timestamp." >> /opt/install-log/operations.txt
exit
fi
echo -e "$user run the script $name at $timestamp." >> /opt/install-log/operations.txt

path=$(pwd)

step=10 # ---------------------------------------------------------------------------------------------------------------- Step Total -

# Start to setup the go and Nodejs.

echo "Step 1/$step Check or download the packages."
mkdir /opt/cache
cd /opt/cache
if [ ! -d "/opt/cache/packages" ]; then
    #git clone https://github.com/hospital-ledger/environment.git
    # Use the gitee in China in order to keep a fast speed to download these files.
    git clone https://gitee.com/Hospital-Ledger/packages.git
    else rm -r -f ./packages
    git clone https://gitee.com/Hospital-Ledger/packages.git
fi
cd /opt/cache/packages
echo "Step 2/$step Unzip the packages."
if [ ! -d "/opt/node-v8.9.4" ]; then
    tar -xvf node-v8.9.4-linux-x64.tar.xz -C /opt
fi
echo "Step 3/$step Copy GO files to the system environment."
if [ ! -d "/opt/go" ]; then
    cp -r -f ./go /opt
    else echo -e "Directory go has been existed."
fi
echo "Step 4/$step Copy Nodejs files to the system environment."
if [ ! -d "/opt/node-v8.9.4" ]; then
    mv -r -f /opt/node-v8.9.4-linux-x64 /opt/node-v8.9.4
    else echo -e "Directory node has been existed."
fi
echo "Step 5/$step Copy GCC files to the system environment."
if [ ! -d "/opt/gcc-7.3.0" ]; then
    cp -r -f ./gcc-7.3.0 /opt
    else echo -e "Directory gcc has been existed."
fi
cd /root
echo "Step 6/$step Make the goroot."
if [ ! -d "gopath" ]; then
    mkdir gopath
fi
cd /opt
echo -e "Step 7/$step Install go 1.13.4 now."
sleep 1
echo "" >> /etc/profile
echo "export GOROOT=/opt/go" >> /etc/profile
echo "export PATH=\$PATH:\$GOROOT/bin" >> /etc/profile
echo "export GOPATH=/root/gopath" >> /etc/profile
source /etc/profile
clear
echo -e "Step 8/$step Check the Go Version."
go version

echo -e "Step 9/$step Install Node.js."
echo "export PATH=\$PATH:/opt/node-v8.9.4-linux-x64/bin" >> /etc/profile
echo "export PATH=\$PATH:/opt/node-v8.9.4/bin" >> /etc/profile
source /etc/profile

# echo "Step 8/$step Install GCC."
# sleep 1
# echo -e "Well, let's install the GCC, it may cost a lot of time."
# echo -e "Maybe..."
# sleep 1
# echo -e "Two hours."
# cd /opt/gcc-7.3.0
# ./contrib/download_prerequisites
# if [ ! -d "gcc-build-7.3.0" ]; then
#     mkdir gcc-build-7.3.0
# fi
# cd /opt/gcc-7.3.0/gcc-build-7.3.0
# ../configure -enable-checking=release -enable-languages=c,c++ -disable-multilib
# make -j 2
# make install
# gcc -v
# sleep 1
# echo "Step 9/$step Copy necessary lib to system path."
# cd /usr/local/lib64
# cp -r -f ./libstdc++.so.6.0.24 /usr/lib64
# cd /usr/lib64
# rm ./libstdc++.so.6
# ln -s ./libstdc++.so.6.0.24 libstdc++.so.6
# cd /opt
# echo "Step $step/$step Install Nodejs v8.9.4."
# cd /opt/node-v8.9.4
# ./configure
# make -j 2
# make install
# clear

echo -e "Step 10/$step Check the Node.js and npm."
node -v
npm -v

# Record to the log.

date=$(date)
echo "goAndNodejs.sh end at ${date}." >> /opt/install-log/running.txt

# Check the status of packages and tecord the log.
docker=$(docker -v)
dockerc=$(docker-compose -v)
if [ "${go}" == "go version go1.13.4 linux/amd64" ]; then
    echo "Go1.13.4 linux/amd64 installed successfully at ${date}." >> /opt/install-log/successed.txt
else echo "Go1.13.4 linux/amd64 installed failed at ${date}, please run goAndNodejs.sh again or install it by yourself." >> /opt/install-log/failed.txt
fi
if [ "${node:0:6}" == "v8.9.4" ]; then
    echo "Nodejs v8.9.4 installed successfully at ${date}." >> /opt/install-log/successed.txt
else echo "Nodejs v8.9.4 installed failed at ${date}, please run goAndNodejs.sh again or install it by yourself." >> /opt/install-log/failed.txt
fi
if [ "${npm:0:5}" == "5.6.0" ]; then
    echo "Nodejs npm v8.9.4 installed successfully at ${date}." >> /opt/install-log/successed.txt
else echo "Nodejs npm v8.9.4 installed failed at ${date}, please run goAndNodejs.sh again or install it by yourself." >> /opt/install-log/failed.txt
fi

# Date 2020-02-22 21:17 Sat by Tom. |- Version 4.0 -| 
