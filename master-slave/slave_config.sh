#!/bin/bash

slave_user_name=$1

sudo useradd $slave_user_name && \
sudo su - $slave_user_name && \
ssh-keygen -t rsa -N "" -f /home/$slave_user_name/.ssh/id_rsa && \
cd .ssh && \
cat id_rsa.pub > authorized_keys && \ 
chmod 700 authorized_keyssudo useradd $slave_user_name

