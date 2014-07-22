#!/bin/bash

trap 'exit' ERR
date > /etc/vagrant_box_build_time


################################################################################
# Vagrant user
################################################################################
VAGRANT_HOME=/home/vagrant
install -v -o vagrant -g vagrant -m 0700 -d $VAGRANT_HOME/.ssh
curl -o $VAGRANT_HOME/.ssh/authorized_keys -kL 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chown vagrant:vagrant $VAGRANT_HOME/.ssh/authorized_keys
chmod 600 $VAGRANT_HOME/.ssh/authorized_keys

cat <<'EOF' > $VAGRANT_HOME/.bash_profile
[ -f ~/.bashrc ] && . ~/.bashrc
export PATH=$PATH:/sbin:/usr/sbin:$HOME/bin
EOF
