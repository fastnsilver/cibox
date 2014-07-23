#!/bin/bash

trap 'exit' ERR

# Set local variables
VAGRANT_HOME=/home/vagrant
GIT_VERSION=2.0.2


# Get and install EPEL
wget http://mirrors.mit.edu/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm
chown vagrant:vagrant $VAGRANT_HOME/epel-release-7-0.2.noarch.rpm
yum -y install epel-release-7-0.2.noarch.rpm


# Install Git
yum -y install curl-devel expat-devel gettext-devel openssl openssl-devel zlib-devel
wget https://www.kernel.org/pub/software/scm/git/git-$GIT_VERSION.tar.gz
chown vagrant:vagrant $VAGRANT_HOME/git-$GIT_VERSION.tar.gz
tar xzf git-$GIT_VERSION.tar.gz
cd git-$GIT_VERSION
make prefix=/usr/local/git all
make prefix=/usr/local/git install
echo "export PATH=/usr/local/git/bin:$PATH" >> /etc/bashrc
source /etc/bashrc
rm -rf $VAGRANT_HOME/git-$GIT_VERSION*

# Install docker
yum install -y docker-io
systemctl enable docker.service
echo -e 'DOCKER_OPTS="-H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock"\n' > /etc/default/docker
systemctl start docker.service
systemctl status docker.service
usermod -a -G docker vagrant


# Pull Centos 7 container
docker pull centos:centos7
