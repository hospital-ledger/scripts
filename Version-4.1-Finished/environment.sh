# Install the packages for CentOS and Ubuntu.
# | - Version-4.1 - |
#!/bin/bash

name="environment.sh"
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

# Path
path=$(pwd)

# Install process.

# CentOS

yum -y update
yum -y upgrade
yum -y install tree
yum -y install lrzsz
yum -y install lbzip2
yum -y install curl
yum -y install wget
yum -y install git
yum -y install python3
yum -y install glibc-headers
yum -y install gcc-c++
yum -y install epel-release
yum -y install python-pip
yum -y install gmp-devel  
yum -y install mpfr-devel  
yum -y install libmpc-devel   
yum -y install bzip2
yum -y install gcc
yum -y install gcc-c++
yum -y install zlib*
yum -y install libffi-devel
yum -y install openssl-devel
yum -y install apr*
yum -y install autoconf
yum -y install automake
yum -y install bison
yum -y install bzip2
yum -y install bzip2*
yum -y install cloog-ppl
yum -y install compat*
yum -y install cpp
yum -y install curl-devel
yum -y install fontconfig
yum -y install fontconfig-devel
yum -y install freetype
yum -y install freetype*
yum -y install freetype-devel
yum -y install gtk+-devel
yum -y install gd
yum -y install gettext
yum -y install gettext-devel
yum -y install glibc
yum -y install kernel
yum -y install kernel-headers
yum -y install keyutils
yum -y install keyutils-libs-devel
yum -y install krb5-devel
yum -y install libcom_err-devel
yum -y install libpng libpng-devel
yum -y install libjpeg*
yum -y install libsepol-devel
yum -y install libselinux-devel
yum -y install libstdc++-devel
yum -y install libtool*
yum -y install libgomp
yum -y install libxml2
yum -y install libxml2-devel
yum -y install libXpm*
yum -y install libtiff
yum -y install libtiff*
yum -y install mpfr
yum -y install ncurses*
yum -y install ntp
yum -y install openssl
yum -y install openssl-devel
yum -y install patch
yum -y install pcre-devel
yum -y install perl
yum -y install php-common
yum -y install php-gd
yum -y install policycoreutils
yum -y install telnet
yum -y install t1lib
yum -y install t1lib*
yum -y install nasm
yum -y install nasm*
yum -y install zlib-devel
yum -y install mlocate
yum -y install automake
yum -y install autoconf
yum -y install libtool
yum -y install make
yum -y install python3
yum -y install python3-devel
yum -y install gcc*
yum -y install automake
yum -y install zlib-devel
yum -y install libjpeg-devel
yum -y install giflib-devel
yum -y install freetype-devel
yum -y install cmake
yum -y install bison-devel
yum -y install ncurses-devel
yum -y install zlib-devel
yum -y install bzip2-devel
yum -y install openssl-devel
yum -y install ncurses-devel
yum -y install sqlite-devel
yum -y install readline-devel
yum -y install tk-devel
yum -y install gdbm-devel
yum -y install db4-devel
yum -y install libpcap-devel
yum -y install xz-devel
yum -y install zlib
yum -y install openssl-devel
yum -y install zlib1g-dev
yum -y install libbz2-dev
yum -y install libssl-dev
yum -y install libncurses5-dev
yum -y install libsqlite3-dev
yum -y install libreadline-dev
yum -y install tk-dev
yum -y install libgdbm-dev
yum -y install libdb-dev
yum -y install libpcap-dev
yum -y install xz-utils
yum -y install libexpat1-dev
yum -y install liblzma-dev
yum -y install libffi-dev
yum -y install libc6-dev
yum -y install python-devel
yum -y install lib32z1
yum -y install lib32ncurses5
yum -y install lib32stdc++6
yum -y update
yum -y upgrade

# Ubuntu

sudo apt upgrade -y
sudo apt update -y
sudo apt-get upgrade -y
sudo apt-get update -y

sudo apt install python3 -y 
sudo apt install python3-pip -y
sudo apt install docker.io -y


mkdir /opt/cache
cd /opt/cache
if [ ! -f "isl-0.15.tar.bz2" ]; then
        wget ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.15.tar.bz2
    else echo -e "File has been download."
fi
if [ ! -d "/opt/cache/isl-0.15.tar.bz2" ]; then
        tar -jxvf isl-0.15.tar.bz2 -C /opt/cache
    else echo -e "The directory exists."
fi
cd /opt/cache/isl-0.15
./configure
make
make install
pip3 install --upgrade pip

# Return the begin path.
cd $path

# Record to the log.
date=$(date)
echo "$name done at ${date}." >> /opt/install-log/operations.txt

# Date 2020-04-06 10:01 Mon by Tom. |- Version 4.1 -| 
