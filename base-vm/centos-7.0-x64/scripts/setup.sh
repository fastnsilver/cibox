#!/bin/bash

set -xe

################################################################################
# Update OS installation
################################################################################

yum install -y update
yum install -y upgrade


################################################################################
# Install basics
################################################################################

# Install minimal packages
yum -y install bzip2 curl gcc make gcc-c++ kernel-devel-`uname -r` linux-headers-generic zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils

# Install X Window System
yum -y groupinstall 'X Window System'

GIT_VERSION=2.0.1
yum -y install curl-devel expat-devel gettext-devel perl-ExtUtils-MakeMaker
wget https://www.kernel.org/pub/software/scm/git/git-$GIT_VERSION.tar.gz
chown veewee:veewee $VEEWEE_HOME/git-$VERSION.tar.gz
tar xzf git-$GIT_VERSION.tar.gz
cd git-$GIT_VERSION
make prefix=/usr/local/git all
make prefix=/usr/local/git install
echo "export PATH=/usr/local/git/bin:$PATH" >> /etc/bashrc
source /etc/bashrc

# Get and install EPEL
wget http://mirrors.mit.edu/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm
yum -y install epel-release-7-0.2.noarch.rpm


################################################################################
# Networking
################################################################################
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers


# Make ssh faster by not waiting on DNS
echo "UseDNS no" >> /etc/ssh/sshd_config
