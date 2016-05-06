#!/bin/bash

echo "Geoffrey: Run as root..."

echo "Geoffrey: Install current nodejs..."
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install -y nodejs
