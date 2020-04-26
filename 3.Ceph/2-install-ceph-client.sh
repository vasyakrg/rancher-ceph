#!/bin/bash

wget -q -O- 'https://download.ceph.com/keys/release.asc' | apt-key add -
echo deb https://download.ceph.com/debian-luminous/ $(lsb_release -sc) main | tee /etc/apt/sources.list.d/ceph.list
apt update && apt install ceph-common -y
modprobe rbd

# from all nodes
# wget -q -O- 'https://download.ceph.com/keys/release.asc' | apt-key add - && echo deb https://download.ceph.com/debian-luminous/ $(lsb_release -sc) main | tee /etc/apt/sources.list.d/ceph.list && apt update && apt install -y ceph-deploy
