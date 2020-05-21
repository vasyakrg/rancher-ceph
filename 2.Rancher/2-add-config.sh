#!/bin/bash

# add config file
cat kube_config_cluster.yml > ~/.kube/test_cluster

# enable config auth
export KUBECONFIG=$(find /Users/vasyansk/Documents/Configs/.kube -maxdepth 1 -type f -name '*' | tr "\n" ":")

# test auth to cluster
kubectl get pods --all-namespaces
