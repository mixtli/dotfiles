#!/bin/bash

for crd in $(kubectl get crds -o name);
do
  if [[ $(echo $crd | grep ambassador) != "" ]];
  then
    kubectl delete $crd
  fi
done

kubectl delete clusterrole ambassador
kubectl delete clusterrole ambassador-crds
kubectl delete clusterrolebinding ambassador
kubectl delete clusterrolebinding ambassador-crds
