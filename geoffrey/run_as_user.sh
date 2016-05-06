#!/bin/bash

echo "Geoffrey: Run as user..."

# make sure we work in the home directory!
cd ~/

echo "Geoffrey: Fetch the current project from github."
git clone https://github.com/ase16/geoffrey.git
cd geoffrey

echo "Geoffrey: Fetch the dependencies."
npm install

echo "Geoffrey: Fetch credentials from google cloud (metadata)."
curl "http://metadata.google.internal/computeMetadata/v1/project/attributes/geoffrey-config-production" -H "Metadata-Flavor: Google" > config/production.json

echo "Geoffrey: Fetch credentials from google cloud (metadata)."
curl "http://metadata.google.internal/computeMetadata/v1/project/attributes/ASE16-json" -H "Metadata-Flavor: Google" > config/ASE16-cd70a773b84a.json.json

echo "Geoffrey: Fetch stormpath env file from google cloud (metadata)."
curl "http://metadata.google.internal/computeMetadata/v1/project/attributes/env-gce" -H "Metadata-Flavor: Google" > .env.gce

echo "Geoffrey: Fetch stormpath env file from google cloud (metadata)."
curl "http://metadata.google.internal/computeMetadata/v1/project/attributes/env-stormpath" -H "Metadata-Flavor: Google" > .env.stormpath

echo "Geoffrey: Start node server in the background."
export NODE_ENV=production
nohup node app.js > geoffrey.log &
