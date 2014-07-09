# Base install

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Source and Register this RHEL instance with Red Hat Customer Portal
# $rcp_user and $rcp_password are externalized in rcp.properties
# These are your Red Hat Customer Portal credentials
. /home/veewee/rhcp.properties
subscription-manager register --username $rcp_user --password $rcp_password --auto-attach


# Install minimal packages
yum -y install gcc make gcc-c++ kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils

# Get and install EPEL
wget http://mirrors.mit.edu/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm
chown veewee:veewee /home/veewee/epel-release-7-0.2.noarch.rpm
yum -y install epel-release-7-0.2.noarch.rpm

# Install docker
yum -y install docker-io

# Make other repositories available
subscription-manager repos --enable rhel-7-server-optional-rpms 
subscription-manager repos --enable rhel-7-server-extras-rpms
subscription-manager repos --enable rhel-7-server-thirdparty-oracle-java-rpms


# Make ssh faster by not waiting on DNS
echo "UseDNS no" >> /etc/ssh/sshd_config
