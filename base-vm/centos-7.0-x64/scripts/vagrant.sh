#!/bin/bash

trap 'exit' ERR
date > /etc/vagrant_box_build_time


################################################################################
# Vagrant user
################################################################################

mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh

wget --no-check-certificate -O /home/vagrant/.ssh/authorized_keys 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys

chown -R vagrant /home/vagrant/.ssh


################################################################################
# Passwordless sudo
################################################################################

echo '%vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

usermod -a -G sudo vagrant
