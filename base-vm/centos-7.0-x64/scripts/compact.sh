#!/bin/bash

trap 'exit' ERR

################################################################################
# Save space in the generated image
################################################################################

# Clean cache
yum -y clean all
rm -rf /var/cache/* /usr/share/doc/*
rm -rf /etc/yum.repos.d/{epel}.repo

# Remove Virtualbox specific files
rm -rf /usr/src/vboxguest* /usr/src/virtualbox-ose-guest*
rm -rf *.iso *.iso.? /tmp/vbox /home/vagrant/.vbox_version

# Cleanup log files
find /var/log -type f | while read f; do echo -ne '' > $f; done;

# Clean tmp directory
rm -rf /tmp/*

# Remove traces of MAC address from network configuration
rm -f /etc/udev/rules.d/70-persistent-net.rules
sed -i '/^UUID/d' /etc/sysconfig/network-scripts/ifcfg-enp0s3
sed -i '/^HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-enp0s3

# Expect the drive zero exhaustion to fail out and then delete.
dd if=/dev/zero of=/EMPTY bs=1M || true
rm -f /EMPTY
