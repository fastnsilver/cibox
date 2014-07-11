# Install docker
yum -y install docker-io

# The sleeper has awoken. Make docker start up on boot.
chkconfig docker on

# Service start
service docker start