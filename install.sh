#!/bin/bash
latest="Version-3.0"
if [ ! -d "/opt/scripts" ]; then
    git checkout $latest
fi
