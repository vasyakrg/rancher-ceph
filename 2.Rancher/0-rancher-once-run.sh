#!/bin/bash

docker run -d --name rancher-1 --restart=unless-stopped -p 443:443 -p 80:80 rancher/rancher --acme-domain rke-test.amegaserver.com
