#!/bin/bash
set -e
set -o pipefail

read -n1 -r -p "Press any key to create $1..."
echo

cd ~/workspace/tal-kubernetes

kubectl --context stagealot create namespace $1
echo 
kubectl --context stagealot --namespace $1 create -f <(cat specs/staging/configmaps/shared-configuration.yaml | sed "s/master/$1/g")
echo 
./bin/set-environment-dns.sh $1
echo

echo "$1 created"
