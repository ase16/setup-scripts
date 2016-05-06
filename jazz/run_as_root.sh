#!/bin/bash

echo "Jazz: Run as root..."

echo "Jazz: Install current nodejs..."
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install -y nodejs
