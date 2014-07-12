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
# from http://szlevi.com/2014/07/03/getting-docker-up-and-running-on-centos-7-beta/
wget http://buildlogs.centos.org/centos/7/docker/CentOS-7-20140625-x86_64-docker_01.img.tar.xz
docker import -< CentOS-7-20140625-x86_64-docker_01.img.tar.xz