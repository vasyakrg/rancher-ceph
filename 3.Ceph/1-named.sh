#!/bin/bash

# add named from all nodes + localhost
echo "95.217.166.88 node-1" >> /etc/hosts && echo "95.216.214.79 node-2" >> /etc/hosts && echo "95.217.166.221 node-3" >> /etc/hosts

# add pass for root - all nodes
passwd root

# ssh keygen from node-1
ssh-keygen

# ssh copy no all nodes from node-1
ssh-copy-id root@node-1 && ssh-copy-id root@node-2 && ssh-copy-id root@node-3
