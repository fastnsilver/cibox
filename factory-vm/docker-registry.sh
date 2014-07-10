# Install Docker Registry

# Become root
sudo -i

# The sleeper has awoken. Make docker start up on boot.
chkconfig docker on

# Service start
service docker start

# Initialize
docker run -p 5000:5000 registry