# Install PostgreSQL
# See https://wiki.postgresql.org/wiki/YUM_Installation

# Become root
sudo -i

# Configure YUM to exclude postgres in favor of local installation
sed "$ a\exclude=postgresql*" /etc/yum/pluginconf.d/rhnplugin.conf

# Install PGDG RPM file 
yum -y localinstall http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-redhat93-9.3-2.noarch.rpm

# Install PostgreSQL 
yum -y install postgresql93-server

# Post install commands
# Note: data directory will be /var/lib/pgsql/9.3/data
service postgresql-9.3 initdb

# Start PostgreSQL automatically on OS startup
chkconfig postgresql-9.3 on