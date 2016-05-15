#!/bin/bash

echo "Phil: Run as root..."

echo "Phil: Install current nodejs..."
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install -y nodejs

echo "Phil: Install build-essential..."
apt-get install -y build-essential
