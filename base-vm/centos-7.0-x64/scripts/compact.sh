#!/bin/bash

set -xe

################################################################################
# Save space in the generated image
################################################################################

yum -y erase avahi freetype
yum -y clean all
rm -rf /etc/yum.repos.d/{epel}.repo

# Remove all shell scripts that were uploaded
rm -f *.sh

# Remove EPEL RPM
rm -f *.rpm

# Remove traces of mac address from network configuration
sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-enp0s3

# Expect the drive zero exhaustion to fail out and then delete.
dd if=/dev/zero of=/blank bs=1M || true
rm -f /blank

sync
