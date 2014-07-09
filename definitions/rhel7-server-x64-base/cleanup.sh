yum -y erase avahi freetype
yum -y clean all
# RJP  - Had to modify - remove puppet references
# rm -rf /etc/yum.repos.d/{puppetlabs,epel}.repo
rm -rf /etc/yum.repos.d/{epel}.repo
rm -rf VBoxGuestAdditions_*.iso

# Remove all shell scripts that were uploaded
rm -f *.sh
rm -f *.properties


# Remove traces of mac address from network configuration
# RJP - had to change this from
# sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-enp0s3
# RJP - had to comment this out
# rm /etc/udev/rules.d/70-persistent-net.rules

