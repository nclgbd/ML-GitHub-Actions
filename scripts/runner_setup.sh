#!/bin/bash

### GITHUB RUNNER SETUP ###
echo "===Adding AWS Spot Instance==="

echo "Running updates"
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release

echo "Creating actions-runner folder"
mkdir actions-runner
cd actions-runner || exit

echo "Downloading latest runner package"
curl -o actions-runner-linux-x64-2.281.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.281.1/actions-runner-linux-x64-2.281.1.tar.gz

# Optional: Validate the hash
echo "04f6c17235d4b29fc1392d5fae63919a96e7d903d67790f81cffdd69c58cb563  actions-runner-linux-x64-2.281.1.tar.gz" | shasum -a 256 -c

echo "Extracting the installer"
tar xzf ./actions-runner-linux-x64-2.281.1.tar.gz

echo "Creating runner and starting configuration experience"
./config.sh --url https://github.com/nclgbd/ML-Training-Template --token AJGIW7XIN4QFQWW6J2LMNSDBHB2HS

echo "Running run.sh"
./run.sh

