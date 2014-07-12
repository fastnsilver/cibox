# Install docker
yum -y install docker-io

# Make docker start up on boot
systemctl enable docker.service

# Start docker
systemctl start docker.service

# Status
systemctl status docker.service
