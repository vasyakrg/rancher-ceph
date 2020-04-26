#!/bin/bash

# create config folder from node-1
mkdir configs && cd configs

# init from node-1
ceph-deploy new node-1 node-2 node-3
cat ceph.conf

# install reqs from node-1
ceph-deploy install --release luminous node-1 node-2 node-3

# monitors start from node-1
ceph-deploy mon create-initial

# copy config to all nodes from node-1
ceph-deploy admin node-1 node-2 node-3

# get status from node-1
ceph status

# start managers from node-1
ceph-deploy mgr create node-1 node-2 node-3

# get status from node-1
ceph status

# get disks from node-1
ssh root@node-1 'fdisk -l' && ssh root@node-2 'fdisk -l' && ssh root@node-3 'fdisk -l'

# start OSD from node-1
ceph-deploy osd create --data /dev/sdb node-1
ceph-deploy osd create --data /dev/sdb node-2
ceph-deploy osd create --data /dev/sdb node-3

# get status from node-1
ceph status
