#!/bin/bash

# add config file
cat kube_config_cluster.yml > ~/.kube/k8s-nsk

# enable config auth
export KUBECONFIG=$(find ~/.kube -maxdepth 1 -type f -name '*' | tr "\n" ":")

# test auth to cluster
kubectl get pods --all-namespaces
