#!/bin/bash

echo "Will: Run as root..."

echo "Will: Install current nodejs..."
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install -y nodejs

echo "Will: Install build-essential..."
apt-get install -y build-essential
