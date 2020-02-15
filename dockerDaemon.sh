#!/bin/bash

path=$(pwd)
# This script will change the daemon of the docker with the offical website of China region.
cd /etc
if [ ! -d "docker" ]; then
mkdir docker
fi
cd docker
echo "{" >> daemon.json
echo "\"registry-mirrors\": [\"https://registry.docker-cn.com\"]" >> daemon.json
echo "}" >> daemon.json
cd $path

# The script last edited by Tom on 2020.02.15 Sat.
