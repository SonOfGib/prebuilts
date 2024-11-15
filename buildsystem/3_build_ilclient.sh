#!/bin/bash

# Set current folder as home
HOME="`cd $0 >/dev/null 2>&1; pwd`" >/dev/null 2>&1

# https://github.com/raspberrypi/userland
if [ ! -d userland ]; then
  git clone https://github.com/raspberrypi/userland
fi
cd userland && ./buildme

# Create inside build folder
cd /opt/vc/src/hello_pi/libs/ilclient
make clean
# not sure why this needs sudo
sudo make -j2

cd $HOME
