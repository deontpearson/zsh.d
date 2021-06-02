#!/bin/bash
set -e
set -o pipefail

export ENV_PODS=$(helm3 --kube-context stagealot --namespace $1 list --short)

echo "Preparing to destroy $1"
echo
echo 'The following pods will be deleted:'
for x in $ENV_PODS; do
    [[ $x != "NAME" ]] && { echo $x; }
done
echo
read -n1 -r -p "Press any key to continue..."
echo

for x in $ENV_PODS; do
    [[ $x != "NAME" ]] && { helm3 --kube-context stagealot delete --purge $x; }
done
echo

kubectl --context stagealot delete namespace $1
