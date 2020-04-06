#!/bin/bash

user=$(whoami)
if [ -d "/opt/install-log" ]; then
    rm -r -f /opt/install-log
fi
echo "$user delete the log successfully."