#!/bin/bash

trap 'exit' ERR

################################################################################
# Install VirtualBox Guest Additions
################################################################################

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=/home/vagrant/VBoxGuestAdditions_${VBOX_VERSION}.iso

# Mount the disk image
mount -o loop $VBOX_ISO /mnt

# Install the additions
# Keep quiet about unnecessary return codes.
yes | sh /tmp/isomount/VBoxLinuxAdditions.run || true

# Unmount
umount /mnt
