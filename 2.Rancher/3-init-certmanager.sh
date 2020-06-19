#!/bin/bash

SERVER=rke-test.amegaserver.com

# Install the CustomResourceDefinition resources separately
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v0.15.0/cert-manager.crds.yaml

# Create the namespace for cert-manager
kubectl create namespace cert-manager

# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io

# Update your local Helm chart repository cache
helm repo update

# Install the cert-manager Helm chart
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v0.15.0

kubectl -n cert-manager rollout status deploy/cert-manager

sleep 10

openssl genrsa -out tls/ca.key 2048
openssl req -x509 -new -nodes -key tls/ca.key -subj "/CN=${SERVER}" -days 3650 -out tls/ca.crt -extensions v3_ca -config tls/openssl-with-ca.cnf

kubectl create secret tls orc-ca-keypair --cert=tls/ca.crt --key=tls/ca.key --namespace=cert-manager

sleep 10

kubectl apply -f certmanager/orc-ca-issuer.yaml
kubectl apply -f certmanager/orc-letsencrypt-issuer.yaml
