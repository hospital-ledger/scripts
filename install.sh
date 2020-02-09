#!/bin/bash
latest="Version-3.0"
if [ ! -d "/opt/scripts" ]; then
    git clone https://github.com/hospital-ledger/scripts.git
fi
if [ -d "/opt/scripts" ]; then
    result=$(git checkout $latest)
    if [ "$result" == "Already on '$latest'" ]; then
        echo -e "All right. Let's start"
        else cd /opt
        rm -f -r scripts
        git clone https://github.com/hospital-ledger/scripts.git
        cd /opt/scripts
        git checkout $latest
        echo -e "Well, all done."
    fi
fi
cd /opt/scripts/
chmod +777 ./*
./first.sh
./second.sh & ./download.sh
./final.sh
