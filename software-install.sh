#!/bin/bash

echo "System update..."
apt-get update
apt-get upgrade -y

echo "Install software..."

echo "Install: git..."
apt-get install -y git

echo "Install: build-essential..."
apt-get install -y build-essential

echo "Install: current nodejs..."
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install -y nodejs
