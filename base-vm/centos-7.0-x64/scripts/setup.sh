EvetnBus#!/bin/bash

trap 'exit' ERR

# Set local variables
VAGRANT_HOME=/home/vagrant
GIT_VERSION=2.1.0

# Get and install Git
yum install -y curl gcc "kernel-devel-$(uname -r)" kernel-devel kernel-headers \
	curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker
wget --retry-connrefused https://www.kernel.org/pub/software/scm/git/git-$GIT_VERSION.tar.gz
chown vagrant:vagrant $VAGRANT_HOME/git-$GIT_VERSION.tar.gz
tar xzf git-$GIT_VERSION.tar.gz
cd git-$GIT_VERSION
make prefix=/usr/local/git all
make prefix=/usr/local/git install
echo "export PATH=/usr/local/git/bin:$PATH" >> /etc/bashrc
source /etc/bashrc
rm -rf $VAGRANT_HOME/git-$GIT_VERSION*

# Install docker
DOCKER_VERSION=1.2.0
DOCKER_ARCH=1.el6.x86_64
wget --retry-connrefused http://kojipkgs.fedoraproject.org/packages/docker-io/$DOCKER_VERSION/1.el6/x86_64/docker-io-$DOCKER_VERSION-$DOCKER_ARCH.rpm
chown vagrant:vagrant $VAGRANT_HOME/docker-io-$DOCKER_VERSION-$DOCKER_ARCH.rpm
yum -y localinstall docker-io-$DOCKER_VERSION-$DOCKER_ARCH.rpm
systemctl enable docker.service
echo -e 'DOCKER_OPTS="-H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock"\n' > /etc/sysconfig/docker
systemctl start docker.service
systemctl status docker.service
usermod -a -G docker vagrant

# Pull Centos 7 container
docker pull centos:centos7

# Provide means for entering a running Docker container other than SSH
# @see https://github.com/Pithikos/docker-enter
# wget https://raw.githubusercontent.com/Pithikos/docker-enter/master/docker-enter.c
# chown vagrant:vagrant $VAGRANT_HOME/docker-enter.c
# chmod +w $VAGRANT_HOME/docker-enter.c
# gcc $VAGRANT_HOME/docker-enter.c -o docker-enter
# rm -f $VAGRANT_HOME/docker-enter.c

# Install appliance-tools. 
# Appliance tools is one method that can be used for creating a VM that can be packaged into a docker container.
yum install -y appliance-tools libguestfs-tools

# Clean up
yum clean all
