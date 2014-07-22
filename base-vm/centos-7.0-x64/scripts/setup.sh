#!/bin/bash

trap 'exit' ERR

# Get and install EPEL
VAGRANT_HOME=/home/vagrant
wget http://mirrors.mit.edu/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm
chown vagrant:vagrant $VAGRANT_HOME/epel-release-7-0.2.noarch.rpm
yum -y install epel-release-7-0.2.noarch.rpm
