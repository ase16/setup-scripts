#!/bin/bash

echo "Run as root..."

echo "Install current nodejs..."
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install -y nodejs

# worker does not need mongodb
# echo "Install mongodb..."
# apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
# echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.2 main" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
# apt-get update -y
# apt-get install -y mongodb-org
