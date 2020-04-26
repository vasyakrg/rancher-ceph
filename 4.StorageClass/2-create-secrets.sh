#!/bin/bash

# create NS
kubectl create namespace ceph-system


# get secrets from node-1
ceph auth get client.kube  2>&1 |grep "key = " |awk '{print  $3'}
ceph auth get client.admin 2>&1 |grep "key = " |awk '{print  $3'}

# create secret files from local
echo client.key > key.client
echo admin.key > key.admin

# create secrets from local
kubectl create secret generic ceph-secret --from-file=key.client --namespace=ceph-system --type=kubernetes.io/rbd
kubectl create secret generic ceph-admin-secret --from-file=key.admin --namespace=ceph-system --type=kubernetes.io/rbd
