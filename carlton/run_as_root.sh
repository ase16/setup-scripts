#!/bin/bash

echo "Carlton: Run as root..."

echo "Carlton: Install current nodejs..."
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install -y nodejs

echo "Carlton: Install build-essential..."
apt-get install -y build-essential
