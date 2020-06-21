#!/bin/bash

# creade persistent volume
kubectl apply -f claim.yaml

# view disk
kubectl get pvc

# deploy hello-app
kubectl apply -f create-file-pod.yaml && kubectl get pods
