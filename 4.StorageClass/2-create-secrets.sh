#!/bin/bash

# create NS
# from you terminal !!!
kubectl create namespace ceph-system

# get secrets from node-1
#1
ceph auth get client.kube  2>&1 |grep "key = " |awk '{print  $3'}
#2
ceph auth get client.admin 2>&1 |grep "key = " |awk '{print  $3'}

# from you terminal !!!
echo "<вывод команды 1>" > key.client
echo "<<вывод команды 2>" > key.admin

# create secrets from local
# from you terminal !!!
kubectl create secret generic ceph-secret --from-file=key.client --namespace=ceph-system --type=kubernetes.io/rbd
kubectl create secret generic ceph-admin-secret --from-file=key.admin --namespace=ceph-system --type=kubernetes.io/rbd
