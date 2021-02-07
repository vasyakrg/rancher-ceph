#!/bin/bash

# run from node-1
# check for installed docker-io !!

docker run -v /etc/ceph:/etc/ceph -p=9128:9128 -td digitalocean/ceph_exporter
