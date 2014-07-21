#!/bin/bash

set -xe
date > /etc/vagrant_box_build_time

################################################################################
# Install VirtualBox Guest Additions
################################################################################

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt

# Shut up GuestAdditions about unnecessary return codes.
yes | sh /mnt/VBoxLinuxAdditions.run || true
umount /mnt

rm VBoxGuestAdditions_$VBOX_VERSION.iso


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
