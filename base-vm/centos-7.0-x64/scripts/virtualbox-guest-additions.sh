#!/bin/bash

################################################################################
# Install VirtualBox Guest Additions
################################################################################

# Install the additions
# Keep quiet about unnecessary return codes.
VAGRANT_HOME=/home/vagrant
mkdir /mnt/VBoxGuestAdditions
mount -o loop $VAGRANT_HOME/VBoxGuestAdditions.iso /mnt/VBoxGuestAdditions
y | sh /mnt/VBoxGuestAdditions/VBoxLinuxAdditions.run || true

# Unmount
umount /mnt/VBoxGuestAdditions
