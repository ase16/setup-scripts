#!/bin/bash

echo "Run as user..."
# make sure we work in the home directory!
cd ~/

git clone https://github.com/ase16/geoffrey.git
cd geoffrey
curl "http://metadata.google.internal/computeMetadata/v1/project/attributes/config-production" -H "Metadata-Flavor: Google" > config/production.json
npm install
export NODE_ENV=production
nohup node worker.js > worker.log &
