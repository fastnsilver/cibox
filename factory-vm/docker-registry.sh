# Install Docker Registry

# Become root
sudo -i

# Initialize
# We've specified two flags: -d and -P. 
# the -d flag which tells Docker to run the container in the background. 
# the -P flag is new and tells Docker to map any required network ports 
# inside our container to our host.
docker run -d -p 5000:5000 registry