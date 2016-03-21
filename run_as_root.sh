#!/bin/bash

echo "Run as root..."

echo "Install current nodejs..."
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install -y nodejs


