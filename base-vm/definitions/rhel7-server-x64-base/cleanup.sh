yum -y erase avahi freetype
yum -y clean all
# RJP  - Had to modify - remove puppet references
# rm -rf /etc/yum.repos.d/{puppetlabs,epel}.repo
rm -rf /etc/yum.repos.d/{epel}.repo


# Remove all shell scripts that were uploaded
rm -f *.sh
# Remove RedHat Customer Portal credentials
rm -f *.properties
# Remove EPEL RPM
rm -f *.rpm
# Remove Git build dir and source
rm -rf git*
# TODO - we should probably remove the veewee and vagrant
# 	users at some point for security reasons (or generate keys)

# Remove traces of mac address from network configuration
# RJP - had to change this from
# sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-enp0s3
# RJP - had to comment this out
# rm /etc/udev/rules.d/70-persistent-net.rules

