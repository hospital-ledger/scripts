# Install the Hospital Ledger Network for CentOS and Ubuntu.
# | - Version-4.1 - |
#!/bin/bash

name="install.sh"
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

./environment.sh
./download.sh

./docker.sh

./goAndNodejs.sh
./images.sh

./fabric.sh

timestamp=$(date)

echo -e "The script $name finished at $timestamp." >> /opt/install-log/operations.txt

# Date 2020-04-06 10:01 Mon by Tom. |- Version 4.1 -| 
