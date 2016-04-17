#!/bin/bash

echo "Run as user..."

# make sure we work in the home directory!
cd ~/

echo "fetch the current project from github."
git clone https://github.com/ase16/geoffrey.git
cd geoffrey

echo "fetch the dependencies."
npm install

echo "fetch credentials from google cloud (metadata)."
curl "http://metadata.google.internal/computeMetadata/v1/project/attributes/config-production" -H "Metadata-Flavor: Google" > config/production.json

echo "start in the background."
export NODE_ENV=production
nohup node worker.js > worker.log &
