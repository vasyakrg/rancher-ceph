#!/bin/bash
# you real IP !!!
MON1=135.181.198.30
MON2=135.181.198.31
MON3=135.181.198.24

cat <<EOF >./storage-class.yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: ceph-rbd
provisioner: ceph.com/rbd
parameters:
  monitors: $MON1:6789, $MON2:6789, $MON3:6789
  pool: kube
  adminId: admin
  adminSecretNamespace: ceph-system
  adminSecretName: ceph-admin-secret
  userId: kube
  userSecretNamespace: ceph-system
  userSecretName: ceph-secret
  imageFormat: "2"
  imageFeatures: layering
EOF

kubectl apply -f storage-class.yaml && rm storage-class.yaml
