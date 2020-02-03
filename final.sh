########################
# Author: Tom          #
# Version:  - 2.0 -    #
# Fabric: 2.0.0        #
# Date: 2020-01-23 Thu #
# Descripiton: We will #
# prepare for centos7. #
# And then set up the  #
# Hyperledger Fabric.  #
########################

#!/bin/bash
echo -e "You need be root account and then you can do it."
echo -e "You can input 'su' and then input your key of root account to login with root account."
user=$(env | grep USER | cut -d "=" -f 2)
if [ "$user" == "root" ]
then echo "The user login with root account successfully. It will start."
else echo "You need to login with root account! Exit and then restart this script!"
exit
fi



if [ ! -d "/opt/go" ]; then
    echo -e "Please run script in order."
    exit 0
    exec
fi
cd /opt/go/src
if [ ! -d "github.com" ]; then
    mkdir github.com
fi
cd github.com
if [ ! -d "hyperledger" ]; then
    mkdir hyperledger
fi
cd hyperledger
if [ -d "fabric" ]; then
    #rm -r -f /opt/go/src/github.com/hyperledger/fabric
    rm -r -f ./fabric
fi
if [ ! -d "/opt/environment" ]; then
    echo -e "Please run script in order."
    exit 0
    exec
fi
cd /opt/environment
cp -r -f /opt/environment/fabric /opt/go/src/github.com/hyperledger/
if [ ! -d "/opt/go/src/github.com/hyperledger/fabric" ]; then
    exit 0
    exec
    else cd /opt/go/src/github.com/hyperledger/fabric
fi
cd /opt/go/src/github.com/hyperledger/fabric
cd scripts
chmod +777 ./*
./bootstrap.sh
echo -e "Start to test the Fabric Environment."
cd /opt/go/src/github.com/hyperledger/fabric
make
sleep 1
echo -e "Test the Fabric example provided by IBM Group."
cd /opt/go/src/github.com/hyperledger/fabric/scripts/
chmod +777 ./*
./bootstrap.sh
sleep 1
cd /opt/go/src/github.com/hyperledger/fabric/scripts/fabric-example/first-network
chmod +777 ./*
./byfn.sh up
./byfn.sh down