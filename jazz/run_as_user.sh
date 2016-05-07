#!/bin/bash

echo "Jazz: Run as user..."

# make sure we work in the home directory!
cd ~/

echo "Jazz: Fetch the current project from github."
git clone https://github.com/ase16/jazz.git
cd jazz

echo "Jazz: Fetch the dependencies."
npm install

echo "Jazz: Fetch credentials from google cloud (metadata)."
curl "http://metadata.google.internal/computeMetadata/v1/project/attributes/jazz-config-production" -H "Metadata-Flavor: Google" > config/production.json

echo "Jazz: Start node server in the background."
export NODE_ENV=production
nohup node app.js > jazz.log 2>&1
