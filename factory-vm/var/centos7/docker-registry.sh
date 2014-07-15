# Install Docker Registry

# Become root
sudo -i

# Install
yum -y install docker-registry

# Make docker-registry start up on boot
systemctl enable docker-registry

# Start docker-registry
systemctl start docker-registry

# Status
systemctl status docker-registry

# Seed registry with CentOS 7.0 Docker image
docker pull centos:centos7