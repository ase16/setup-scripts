#!/bin/bash

echo "Will: Run as user..."

# make sure we work in the home directory!
cd ~/

echo "Will: Fetch the current project from github."
git clone https://github.com/ase16/will.git
cd will

echo "Will: Fetch the dependencies."
npm install

echo "Will: Fetch credentials from google cloud (metadata)."
curl "http://metadata.google.internal/computeMetadata/v1/project/attributes/will-config-production" -H "Metadata-Flavor: Google" > config/production.json

echo "Will: Start node server in the background."
export NODE_ENV=production
nohup node app.js > will.log 2>&1
