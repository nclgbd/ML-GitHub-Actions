#!/bin/bash

# Set the below variables so that upon spinning up a spot instance on EC2, it'll have the correct parameters. Do NOT commit this file
# to your repo, and you can find a blank template here: https://github.com/nclgbd/ML-GitHub-Actions/blob/master/scripts/runner_setup.sh 
## `REPO` - the name of the repository
## `USER` - the name of the user
## `PAT` - your PAT for accessing GitHub

REPO=
USER=
URL=
PAT=
TOKEN="$(curl -X POST \
  -H "Authorization: token $PAT" \
  -H "Accept: application/vnd.github.v3+json" \
  "https://api.github.com/repos/$USER/$REPO/actions/runners/registration-token"\
  | python -c "import sys, json; print json.load(sys.stdin)['token']")"

echo "$TOKEN"


### GITHUB RUNNER SETUP ###

echo "Running updates"
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release

echo "Creating actions-runner folder"
mkdir actions-runner
cd actions-runner || exit

echo "Downloading latest runner package"
curl -o actions-runner-linux-x64-2.281.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.281.1/actions-runner-linux-x64-2.281.1.tar.gz

echo "Extracting the installer"
tar xzf ./actions-runner-linux-x64-2.281.1.tar.gz
echo "Creating runner and starting configuration experience"
./config.sh --unattended --url "$URL" --token "$TOKEN"

echo "Running run.sh"
nohup ./run.sh
