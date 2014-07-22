#!/bin/bash

trap 'exit' ERR
date > /etc/vagrant_box_build_time


################################################################################
# Vagrant user
################################################################################
VAGRANT_HOME=/home/vagrant
mkdir -p $VAGRANT_HOME/.ssh
chmod 0700 $VAGRANT_HOME/.ssh

wget --no-check-certificate -O $VAGRANT_HOME/.ssh/authorized_keys 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 $VAGRANT_HOME/.ssh/authorized_keys

chown -R vagrant:vagrant $VAGRANT_HOME/.ssh
