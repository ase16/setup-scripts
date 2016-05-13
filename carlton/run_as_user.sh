#!/bin/bash

echo "Carlton: Run as user..."

# make sure we work in the home directory!
cd ~/

echo "Carlton: Fetch the current project from github."
git clone https://github.com/ase16/carlton.git
cd carlton

echo "Carlton: Fetch the dependencies."
npm install

echo "Carlton: Fetch credentials from google cloud (metadata)."
curl "http://metadata.google.internal/computeMetadata/v1/project/attributes/carlton-config-production" -H "Metadata-Flavor: Google" > config/production.json

echo "Carlton: Fetch stormpath env file from google cloud (metadata)."
curl "http://metadata.google.internal/computeMetadata/v1/project/attributes/env-stormpath" -H "Metadata-Flavor: Google" > .env.stormpath

echo "Carlton: Start node server in the background."
export NODE_ENV=production
nohup node app.js > carlton.log 2>&1 &
