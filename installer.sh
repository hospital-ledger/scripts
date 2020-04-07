# The latest Version is Version-4.0 and we suggest you to use Version-4.0, this installer supports the Version-4.0.

# You can edit the version and choose the version to install.
version="4.1" # <-- You can edit it to change version.
# Support List [ "4.1" ]

# You can download installer-Version-3.0 for old version.
# We start to use this installer since Version-4.0 in 2020.

# Information of this script.
# Lastest edited by Tom 16:02 2020-02-23 Sun.

# Introduction
# This is the installer for the blockchain network, it provides for Linux operating system.

# Requirement
# You can install the network on CentOS 7 and Ubuntu 18.04.3 LTS.
# The architecture of the CPU must be X86_64.
# The disk need to have more than 50G free.
# The memory need to larger than 2G.

# The main software list
# Docker latest
# Docker-compose latest
# Go 1.13.4
# Node.js v8.9.4
# GCC 7.3.0/7.4.0
# Hyperledger fabric 2.0.0

# Docker images list
#
# hyperledger/fabric-tools:latest
# hyperledger/fabric-peer:latest
# hyperledger/fabric-orderer:latest
# hyperledger/fabric-ccenv:latest
# hyperledger/fabric-baseos:latest
# hyperledger/fabric-javaenv:latest
# hyperledger/fabric-nodeenv:latest
# hyperledger/fabric-ca:latest
# hyperledger/fabric-zookeeper:latest
# hyperledger/fabric-kafka:latest
# hyperledger/fabric-couchdb:latest
#
# hyperledger/fabric-tools:2.0
# hyperledger/fabric-peer:2.0
# hyperledger/fabric-orderer:2.0
# hyperledger/fabric-ccenv:2.0
# hyperledger/fabric-baseos:2.0
# hyperledger/fabric-javaenv:2.0
# hyperledger/fabric-nodeenv:2.0
# hyperledger/fabric-ca:1.4
# hyperledger/fabric-zookeeper:0.4
# hyperledger/fabric-kafka:0.4
# hyperledger/fabric-couchdb:0.4
#
# hyperledger/fabric-tools:2.0.0
# hyperledger/fabric-peer:2.0.0
# hyperledger/fabric-orderer:2.0.0
# hyperledger/fabric-ccenv:2.0.0
# hyperledger/fabric-baseos:2.0.0
# hyperledger/fabric-javaenv:2.0.0
# hyperledger/fabric-nodeenv:2.0.0
# hyperledger/fabric-ca:1.4.4
# hyperledger/fabric-zookeeper:0.4.18
# hyperledger/fabric-kafka:0.4.18
# hyperledger/fabric-couchdb:0.4.18
#
# nginx:latest
# alpine:3.10
# golang:1.13.4-alpine
# golang:1.13.4-alpine3.10

# Nankai University 2020 © All Rights Reserved.
#
#________________________________________________________________________________________________________________________+
#|                                                                                                                       |
#|                                                                                                                       |
#|                                                                                                                       |
#|                                                                                                                       |
#|      |    |                         ~    |            |               |                  |                            | 
#|      |____|  ____    _____   ____      __|__   ___    |               |       ____   ____|    ____   ____   ____      |
#|      |    | |    |  |____   |    |  |    |      __|   |               |      |___|  |    |   |    | |___|  |          |
#|      |    | |____|  _____|  |____|  |    |__|  |__|_  |__|            |_____ |____| |____|_  |____| |____| |          |
#|                             |                                                                     |                   |
#|                             |                                                                |____|                   |
#|                                                                                                                       |
#|                                                                                                                       |
#|                                                                                                                       |
#|                                                                                                                       |
#|  Hospital Ledger                                                                                                      |
#|  Medical Data Blockchain Services Platform                                                                            |
#|  Nankai University                                                             2020 Copyright. All Rights Reserved.   |
#|_______________________________________________________________________________________________________________________|
#
#                                                  - Installer Version 4.1 -
#
#----------------------------------------------------------  Start  ----------------------------------------------------------

# Check the Version Chose.
bool="false"
supportList=("4.1")
for element in ${supportList[@]}
do
    if [ "$version" == "$element" ]; then
        bool="true"
    fi
done
if [ "$bool" == "true" ]; then
    echo "This Version $version can be installed by this installer."
    else echo "This $version cannot be installed by this installer."
    echo "They are supported for this installer."
    for element in ${supportList[@]}
    do 
        echo "$element"
    done
    echo "Please choose the right version and then restart the installer."
    exit
fi

# Title
./title.sh

# Installer
path=$(pwd)
name="install.sh"
timestamp=$(date)

# Mkdir for Cache.
mkdir /opt/cache

# Judge the account of the user.
mkdir /opt/install-log
echo -e "You need be root account and then you can do it."
echo -e "You can input 'su' and then input your key of root account to login with root account."
user=$(whoami)
echo "$user try to run the script $name at $timestamp." >> /opt/install-log/operations.txt
if [ "$user" == "root" ];
then echo "The user login with root account successfully. It will start."
else echo "You need to login with root account! Exit and then you can restart this script!" >> /opt/install-log/operations.txt
     echo "$user failed to run the scripts $name at $timestamp." >> /opt/install-log/operations.txt
exit
fi
echo -e "$user run the script $name at $timestamp." >> /opt/install-log/operations.txt

# Clone the scripts to Cache

# Choosing the Linux Version.
echo "Step 3/$step Check the Linux Version and install the packages of them."
linux=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
# if [ "$linux" == "\"Ubuntu\"" -o "$linux" == "\"CentOS Linux\"" ]; then
#     if [ "$linux" == "\"Ubuntu\"" ]; then
sudo apt install git -y #         sudo apt install git -y
#         else
yum install git -y #         yum install git -y
#     fi
#     else echo "The Linux is not supportted by these scripts."
#     exit
# fi
cd /opt/cache 
git clone https://github.com/hospital-ledger/scripts.git 

# Change the branch
branch="Version-${version}"
result="Already on 'Version-$version'
Your branch is up to date with 'origin/Version-$version'."

cd /opt/cache/scripts
output=$(git checkout $branch)
# if [ "$output" == "$result" ]; then
./install.sh #     ./install.sh
#     else echo "The branch checkout failed." >> /opt/install-log/operations.txt
#     echo "The branch checkout failed." >> /opt/install-log/failed.txt
#     echo -e "\033[31m/\033[5m ! \033[0m\033[31m\\ \033[5m Alert! \033[0m\033[0m The branch checkout failed."
# fi

# Delete cache
# if [ -d "/opt/cache" ]; then
#     cd /opt
#     rm -r -f ./cache
# fi
cd $path
source /etc/profile
# Record.
date=$(date)

docker=$(docker -v)
dockercompose=$(docker-compose -v)
go=$(go version)
node=$(node -v)
npm=$(npm -v)

echo -e "/!\\ Please check the error and the software packages. /!\\"

if [ "${docker:0:6}" == "Docker" ]; then
    printf "\033[34m Docker \033[0m"
    else printf "\033[31m Docker \033[0m"
fi
if [ "${dockercompose:0:14}" == "docker-compose" ]; then
    printf "\033[34m Docker-compose \033[0m"
    else printf "\033[31m Docker-compose \033[0m"
fi
if [ "${go}" == "go version go1.13.4 linux/amd64" ]; then
    printf "\033[34m Go \033[0m"
    else printf "\033[31m Go \033[0m"
fi
if [ "${node:0:6}" == "v8.9.4" ]; then
    printf "\033[34m Node.js \033[0m"
    else printf "\033[31m Node.js \033[0m"
fi
if [ "${npm:0:5}" == "5.6.0" ]; then 
    printf "\033[34m npm \033[0m"
    else printf "\033[31m npm \033[0m"
fi

echo -e "Well, all done, please check the fabric network and log infomartion."
echo -e "\033[31m Log information in \033[0m \033[36m /opt/install-log \033[0m"

#----------------------------------------------------------   End   ----------------------------------------------------------

