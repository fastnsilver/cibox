# Base install
VEEWEE_HOME=/home/veewee
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Install minimal packages
yum -y install bzip2 gcc make gcc-c++ kernel-devel-`uname -r` linux-headers-generic zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils

# Install X Window System
yum -y groupinstall 'X Window System'

# Get and install EPEL
wget http://mirrors.mit.edu/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm
chown veewee:veewee $VEEWEE_HOME/epel-release-7-0.2.noarch.rpm
yum -y install epel-release-7-0.2.noarch.rpm

# Make RPMForge repo available
## RHEL/CentOS 6 64 Bit OS ##
# wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
# rpm -Uvh rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm

# Make ssh faster by not waiting on DNS
echo "UseDNS no" >> /etc/ssh/sshd_config
