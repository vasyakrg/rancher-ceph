#!/bin/bash

docker run -d --name rancher-1 --restart=unless-stopped -p 8443:443 rancher/rancher --acme-domain rke-test.amegaserver.com
