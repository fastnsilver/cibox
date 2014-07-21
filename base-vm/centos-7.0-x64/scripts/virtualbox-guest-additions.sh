#!/bin/bash

trap 'exit' ERR

################################################################################
# Install VirtualBox Guest Additions
################################################################################

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)

# Mount the disk image
cd /tmp
mkdir /tmp/isomount
mount -o loop /root/VBoxGuestAdditions_$VBOX_VERSION.iso /tmp/isomount

# Install the additions
# Keep quiet about unnecessary return codes.
yes | sh /tmp/isomount/VBoxLinuxAdditions.run || true

# Cleanup
umount isomount
rm -Rf isomount /root/VBoxGuestAdditions_$VBOX_VERSION.iso