#!/bin/bash

echo "Phil: Run as user..."

# make sure we work in the home directory!
cd ~/

echo "Phil: Fetch the current project from github."
git clone https://github.com/ase16/phil.git
cd phil

echo "Phil: Fetch the dependencies."
npm install

echo "Phil: Fetch credentials from google cloud (metadata)."
curl "http://metadata.google.internal/computeMetadata/v1/project/attributes/phil-config-production" -H "Metadata-Flavor: Google" > config/production.json

echo "Phil: Start node server in the background."
export NODE_ENV=production
nohup node app.js > phil.log 2>&1 &
