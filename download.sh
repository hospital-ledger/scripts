# Download the packages cache for the installer.
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

path=$(pwd)

sudo apt install git -y
yum install git -y

# clone from the gitee and GitHub.
mkdir /opt/cache
cd /opt/cache
git clone https://github.com/hospital-ledger/scripts.git
git clone https://gitee.com/Hospital-Ledger/packages.git
git clone https://gitee.com/Hospital-Ledger/fabric.git
git clone https://gitee.com/Hospital-Ledger/fabric-samples.git

# Return before path.
cd path

# Record the log.
date=$(date)
echo "$name done at ${date}." >> /opt/install-log/operations.txt

# Date 2020-02-23 11:27 Sun by Tom. |- Version 4.1 -| 
