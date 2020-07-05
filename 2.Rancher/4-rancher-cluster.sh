#!/bin/bash

# create and set domain name `rke-test.amegaserver.com` in DNS-servers BEFORE!

HOST_NAME=rke.amegaserver.com
LETS_EMAIL=vasyakrg@gmail.com

kubectl create namespace cattle-system

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest

#with Lets
helm upgrade --install rancher \
  rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname=${HOST_NAME} \
  --set ingress.tls.source=letsEncrypt \
  --set letsEncrypt.email=${LETS_EMAIL}

# with custom CA
# kubectl -n cattle-system create secret tls tls-rancher-ingress \
#   --cert=tls/tls.crt \
#   --key=tls/tls.key

# kubectl -n cattle-system create secret generic tls-ca \
#   --from-file=tls/ca.pem

# helm upgrade --install rancher \
#     rancher-latest/rancher \
#   --namespace cattle-system \
#   --set hostname=${HOST_NAME} \
#   --set ingress.tls.source=secret \
#   --set ingress.extraAnnotations.'certmanager\.k8s\.io/cluster-issuer'=ca-key-pair

kubectl -n cattle-system rollout status deploy/rancher
