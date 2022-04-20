#!/bin/bash

SLAVE_NODE_PRIVATE_IP=$1

sudo mkdir -p /var/lib/jenkins/.ssh && \
cd /var/lib/jenkins/.ssh && \
cd .. && \
sudo chmod 777 .ssh && \
cd .ssh && \
sudo ssh-keyscan -H $SLAVE_NODE_PRIVATE_IP >>/var/lib/jenkins/.ssh/known_hosts && \
sudo chown jenkins:jenkins known_hosts && \
sudo chmod 700 known_hosts
