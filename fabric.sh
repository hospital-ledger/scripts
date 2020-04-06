# Install the fabric network and test.
# | - Version-4.1 - |
#!/bin/bash

name="fabric.sh"
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

# Check Go and packages.

# Copy fabric to go.
mkdir /opt/go/src/github.com
mkdir /opt/go/src/github.com/hyperledger
cp -r -f /opt/cache/fabric /opt/go/src/github.com/hyperledger
cp -r -f /opt/cache/fabric-samples /opt/go/src/github.com/hyperledger/fabric/scripts
rm -r -f /opt/go/src/github.com/hyperledger/fabric/scripts/bootstrap.sh
cp /opt/cache/scripts/bootstrap.sh /opt/go/src/github.com/hyperledger/fabric/scripts
cp -r -f /opt/cache/fabric-samples /opt/go/src/github.com/hyperledger/fabric/scripts
cp /opt/cache/packages/hyperledger-fabric-ca-linux-amd64-1.4.4.tar.gz /opt/go/src/github.com/hyperledger/fabric/scripts/fabric-samples
cp /opt/cache/packages/hyperledger-fabric-linux-amd64-2.0.0.tar.gz /opt/go/src/github.com/hyperledger/fabric/scripts/fabric-samples
sudo tar -zxvf /opt/cache/packages/hyperledger-fabric-ca-linux-amd64-1.4.4.tar.gz -C /opt/go
sudo tar -zxvf /opt/cache/packages/hyperledger-fabric-ca-linux-amd64-1.4.4.tar.gz -C /root
sudo tar -zxvf /opt/cache/packages/hyperledger-fabric-linux-amd64-2.0.0.tar.gz -C /opt/go
sudo tar -zxvf /opt/cache/packages/hyperledger-fabric-linux-amd64-2.0.0.tar.gz -C /root
chmod +x /opt/go/src/github.com/hyperledger/fabric/scripts/bootstrap.sh
/opt/go/src/github.com/hyperledger/fabric/scripts/bootstrap.sh

cd /opt/go/src/github.com/hyperledger/fabric/scripts/fabric-samples/first-network
/opt/go/src/github.com/hyperledger/fabric/scripts/fabric-samples/first-network/byfn.sh generate
/opt/go/src/github.com/hyperledger/fabric/scripts/fabric-samples/first-network/byfn.sh up
/opt/go/src/github.com/hyperledger/fabric/scripts/fabric-samples/first-network/byfn.sh down

cd $path

# Date 2020-04-06 21:17 Sat by Tom. |- Version 4.1 -| 
