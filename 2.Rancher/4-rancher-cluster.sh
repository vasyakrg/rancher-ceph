#!/bin/bash

# create and set domain name `rke.amegaserver.com` in DNS-servers BEFORE!

kubectl create namespace cattle-system

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=rke.amegaserver.com --set ingress.tls.source=letsEncrypt --set letsEncrypt.email=vasyakrg@gmail.com
