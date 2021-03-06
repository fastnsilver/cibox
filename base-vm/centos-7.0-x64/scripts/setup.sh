#!/bin/bash

trap 'exit' ERR

# Set local variables
VAGRANT_HOME=/home/vagrant
GIT_VERSION=2.1.0

# Get and install Git
yum install -y curl gcc intltool gperf glib2-devel "kernel-devel-$(uname -r)" kernel-devel kernel-headers \
	curl-devel expat-devel gettext-devel libcap-devel openssl-devel xz-devel zlib-devel perl-ExtUtils-MakeMaker
wget --retry-connrefused https://www.kernel.org/pub/software/scm/git/git-$GIT_VERSION.tar.gz
chown vagrant:vagrant $VAGRANT_HOME/git-$GIT_VERSION.tar.gz
tar xzf git-$GIT_VERSION.tar.gz
cd git-$GIT_VERSION
make prefix=/usr/local/git all
make prefix=/usr/local/git install
echo "export PATH=/usr/local/git/bin:$PATH" >> /etc/bashrc
source /etc/bashrc
rm -rf $VAGRANT_HOME/git-$GIT_VERSION*

# Update systemd
# @see http://linoxide.com/linux-how-to/install-systemd-centos-redhat/
# cd $VAGRANT_HOME
# wget --retry-connrefused http://www.freedesktop.org/software/systemd/systemd-216.tar.xz 
# chown vagrant:vagrant $VAGRANT_HOME/systemd-216.tar.xz
# tar -xJf systemd-216.tar.xz
# cd systemd-216
# ./configure
# make && make install
# systemctl daemon-reexec
# systemctl --version

# Install Docker
cd $VAGRANT_HOME
DOCKER_VERSION=1.2.0
DOCKER_OS=4.el7.centos
DOCKER_ARCH=x86_64
wget --retry-connrefused http://cbs.centos.org/kojifiles/packages/docker/$DOCKER_VERSION/$DOCKER_OS/$DOCKER_ARCH/docker-$DOCKER_VERSION-$DOCKER_OS.$DOCKER_ARCH.rpm
chown vagrant:vagrant $VAGRANT_HOME/docker-$DOCKER_VERSION-$DOCKER_OS.$DOCKER_ARCH.rpm
rpm -i docker-$DOCKER_VERSION-$DOCKER_OS.$DOCKER_ARCH.rpm
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
