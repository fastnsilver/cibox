#!/bin/bash

trap 'exit' ERR

################################################################################
# Update OS installation
################################################################################

yum -y update
yum -y upgrade


################################################################################
# Install basics
################################################################################

# Install minimal packages
yum -y install bzip2 curl gcc make gcc-c++ kernel-devel-`uname -r` linux-headers-generic zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils

# Get and install EPEL
VAGRANT_HOME=/home/vagrant
wget http://mirrors.mit.edu/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm
chown vagrant:vagrant $VAGRANT_HOME/epel-release-7-0.2.noarch.rpm
yum -y install epel-release-7-0.2.noarch.rpm


################################################################################
# Networking
################################################################################
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers


# Make ssh faster by not waiting on DNS
echo "UseDNS no" >> /etc/ssh/sshd_config
