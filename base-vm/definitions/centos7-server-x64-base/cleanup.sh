yum -y erase avahi freetype
yum -y clean all
# RJP  - Had to modify - remove puppet references
# rm -rf /etc/yum.repos.d/{puppetlabs,epel}.repo
rm -rf /etc/yum.repos.d/{epel}.repo


# Remove all shell scripts that were uploaded
rm -f *.sh

# Remove EPEL RPM
rm -f *.rpm

# Remove traces of mac address from network configuration
sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-enp0s3

