#!/bin/bash

trap 'exit' ERR

################################################################################
# Save space in the generated image
################################################################################

# Remove ruby build libs
yum -y remove zlib-devel openssl-devel readline-devel

# Cleanup other files we do not need
yum -y groupremove "Dialup Networking Support" Editors "Printing Support" "Additional Development" "E-mail server"

# Clean cache
yum -y clean all
rm -rf /var/cache/* /usr/share/doc/*
rm -rf /etc/yum.repos.d/{epel}.repo

# Remove all shell scripts that were uploaded
rm -f *.sh

# Remove EPEL RPM
rm -f *.rpm

#######################################################
# Turn off un-needed services
#######################################################
systemctl disable sendmail.service
systemctl disable vbox-add-x11.service
systemctl disable smartd.service
systemctl disable ntpd.service
systemctl disable cupsd.service

# Remove traces of MAC address from network configuration
sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-enp0s3

# Expect the drive zero exhaustion to fail out and then delete.
dd if=/dev/zero of=/blank bs=1M || true
rm -f /blank

sync
