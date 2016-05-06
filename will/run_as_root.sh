#!/bin/bash

echo "Will: Run as root..."

echo "Will: Install current nodejs..."
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install -y nodejs
