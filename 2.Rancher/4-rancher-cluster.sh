#!/bin/bash

# create and set domain name `rke.amegaserver.com` in DNS-servers BEFORE!

HOST_NAME=rke.amegaserver.com
LETS_EMAIL=vasyakrg@gmail.com

kubectl create namespace cattle-system

kubectl -n cattle-system create secret tls tls-rancher-ingress \
  --cert=tls/tls.crt \
  --key=tls/tls.key

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest

# with Lets
# helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=${HOST_NAME} --set ingress.tls.source=letsEncrypt --set letsEncrypt.email=${LETS_EMAIL}

# with custom CA

helm install rancher-latest/rancher \
  --name rancher \
  --namespace cattle-system \
  --set hostname=${HOST_NAME} \
  --set ingress.tls.source=secret
  --set privateCA=true

kubectl -n cattle-system rollout status deploy/rancher
