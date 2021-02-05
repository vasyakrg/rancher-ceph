#!/bin/bash

# add named from all nodes + localhost
echo "135.181.198.30 node-1" >>/etc/hosts && echo "135.181.198.31 node-2" >>/etc/hosts && echo "135.181.198.24 node-3" >>/etc/hosts

# add pass for root - all nodes
passwd root

# ssh keygen from node-1
ssh-keygen

# ssh copy no all nodes from node-1
ssh-copy-id root@node-1 && ssh-copy-id root@node-2 && ssh-copy-id root@node-3
