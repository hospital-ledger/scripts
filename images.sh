# Download the necessary docker images.
# | - Version-4.1 - |
#!/bin/bash

name="download.sh"
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

# Download images.
docker pull hyperledger/fabric-tools:latest
docker pull hyperledger/fabric-peer:latest
docker pull hyperledger/fabric-orderer:latest
docker pull hyperledger/fabric-ccenv:latest
docker pull hyperledger/fabric-baseos:latest
docker pull hyperledger/fabric-javaenv:latest
docker pull hyperledger/fabric-nodeenv:latest
docker pull hyperledger/fabric-ca:latest
docker pull hyperledger/fabric-zookeeper:latest
docker pull hyperledger/fabric-kafka:latest
docker pull hyperledger/fabric-couchdb:latest

docker pull hyperledger/fabric-tools:2.0
docker pull hyperledger/fabric-peer:2.0
docker pull hyperledger/fabric-orderer:2.0
docker pull hyperledger/fabric-ccenv:2.0
docker pull hyperledger/fabric-baseos:2.0
docker pull hyperledger/fabric-javaenv:2.0
docker pull hyperledger/fabric-nodeenv:2.0
docker pull hyperledger/fabric-ca:1.4
docker pull hyperledger/fabric-zookeeper:0.4
docker pull hyperledger/fabric-kafka:0.4
docker pull hyperledger/fabric-couchdb:0.4

docker pull hyperledger/fabric-tools:2.0.0
docker pull hyperledger/fabric-peer:2.0.0
docker pull hyperledger/fabric-orderer:2.0.0
docker pull hyperledger/fabric-ccenv:2.0.0
docker pull hyperledger/fabric-baseos:2.0.0
docker pull hyperledger/fabric-javaenv:2.0.0
docker pull hyperledger/fabric-nodeenv:2.0.0
docker pull hyperledger/fabric-ca:1.4.4
docker pull hyperledger/fabric-zookeeper:0.4.18
docker pull hyperledger/fabric-kafka:0.4.18
docker pull hyperledger/fabric-couchdb:0.4.18

docker pull nginx:latest
docker pull alpine:3.10
docker pull golang:1.13.4-alpine
docker pull golang:1.13.4-alpine3.10

# # These images may be wrong for different computers. 
# docker pull hyperledger/fabric-tools:amd64-2.0.0-snapshot-02cde2c
# docker pull hyperledger/fabric-peer:amd64-2.0.0-snapshot-02cde2c
# docker pull hyperledger/fabric-orderer:amd64-2.0.0-snapshot-02cde2c
# docker pull hyperledger/fabric-ccenv:amd64-2.0.0-snapshot-02cde2c
# docker pull hyperledger/fabric-baseos:amd64-2.0.0-snapshot-02cde2c

# Check the docker images and record the log.
images=$(docker images)                                    
date=$(date)

echo "Docker images download at ${date}." > /opt/install-log/images.txt
echo "Docker images download at ${date}." > /opt/install-log/operations.txt
echo "Docker images download at ${date}." > /opt/install-log/successed.txt

echo "${images}" >> /opt/install-log/images.txt

echo "Please check the Docker Images List and compare with the List on Github.com, thank you." >> /opt/install-log/images.txt
echo "Please check the Docker Images List and compare with the List on Github.com, thank you." >> /opt/install-log/operations.txt
echo "Please check the Docker Images List and compare with the List on Github.com, thank you." >> /opt/install-log/successed.txt

echo -e "Please check the Docker Images List and compare with the List on Github.com, thank you." 

# Date 2020-02-23 10:01 Sun by Tom. |- Version 4.1 -| 
