#!/bin/bash

################################################################################
# Install VirtualBox Guest Additions
################################################################################

# Install the additions
# Keep quiet about unnecessary return codes.
VAGRANT_HOME=/home/vagrant
mkdir /mnt/VBoxGuestAdditions
mount -o loop $VAGRANT_HOME/VBoxGuestAdditions.iso /mnt/VBoxGuestAdditions
yes | sh /mnt/VBoxGuestAdditions/VBoxLinuxAdditions.run

# Unmount
umount /mnt/VBoxGuestAdditions
