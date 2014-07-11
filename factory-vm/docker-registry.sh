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

# Seed registry with RHEL 7.0 Docker image
# Assumes image may be found in /opt/docker-images
# Mapped via synced folder, https://docs.vagrantup.com/v2/synced-folders/basic_usage.html
docker load -i /opt/docker-images/rhel-server-docker-7.0-21.4.x86_64.tar.gz