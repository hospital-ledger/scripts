# Install and setup the docker and docker-compose latest version.
# | - Version-4.1 - |
#!/bin/bash

name="docker.sh"
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

# Installing
curl -fsSL https://get.docker.com/ | sh
pip3 install --upgrade pip
pip install --upgrade pip
pip3 install docker-compose
pip install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
# Setting up
systemctl restart docker
groupadd docker
usermod -aG docker root
usermod -aG docker ubuntu
usermod -aG docker $user
gpasswd -a root docker
gpasswd -a ubuntu docker
gpasswd -a $user docker
cat /etc/group | grep ^docker
systemctl restart docker
systemctl enable docker
systemctl restart docker

# Record the log.
date=$(date)
echo "docker.sh end at ${date}." >> /opt/install-log/running.txt

# Check the status of packages and tecord the log.
docker=$(docker -v)
dockerc=$(docker-compose -v)
if [ "${docker:0:6}" == "Docker" ]; then
    echo "Docker installed successfully at ${date}." >> /opt/install-log/successed.txt
else echo "Docker installed failed at ${date}, please run docker.sh again or install it by yourself." >> /opt/install-log/failed.txt
fi
if [ "${dockerc:0:14}" == "docker-compose" ]; then
    echo "Docker-compose installed successfully at ${date}." >> /opt/install-log/successed.txt
else echo "Docker-compose installed failed at ${date}, please run docker.sh again or install it by yourself." >> /opt/install-log/failed.txt
fi

# Date 2020-02-22 21:17 Sat by Tom. |- Version 4.1 -| 
