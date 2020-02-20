#!/bin/bash
su
sudo apt upgrade
sudo apt update
sudo apt-get upgrade
sudo apt-get update

sudo apt install python3
sudo apt install python3-pip
sudo apt install docker.io & pip3 install docker
cd /opt
git clone https://gitee.com/Hospital-Ledger/packages.git
git clone https://github.com/hospital-ledger/scripts.git
cd scripts
git checkout Version-3.0
cd ../packages
sudo cp -r -f go /opt
sudo tar -zxvf node-v8.9.4-linux-x64.tar.xz -C /opt
sudo tar -zxvf hyperledger-fabric-ca-linux-amd64-1.4.4.tar.gz -C /opt/go/bin
sudo tar -zxvf hyperledger-fabric-ca-linux-amd64-1.4.4.tar.gz -C /root
sudo tar -zxvf hyperledger-fabric-linux-amd64-2.0.0.tar.gz -C /opt/go
sudo tar -zxvf hyperledger-fabric-linux-amd64-2.0.0.tar.gz -C /root
echo "export GOROOT=/opt/go" >> /etc/profile
echo "export PATH=\$PATH:\$GOROOT/bin" >> /etc/profile
echo "export GOPATH=/root/gopath" >> /etc/profile
echo "export"
source /etc/profile
go version
node -v
npm -v
cd ../scripts
chmod +x ./download.sh
./download.sh

cd /opt/go/src/
mkdir github.com && cd github.com
mkdir hyperledger && cd hyperledger
git clone https://gitee.com/Hospital-Ledger/fabric.git
cd fabric/scripts
./bootstrap.sh
cd fabric-samples
cd first-network
./byfn.sh up
