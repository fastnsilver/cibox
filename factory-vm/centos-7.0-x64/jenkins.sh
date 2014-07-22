# Install Jenkins

# Become root
sudo -i

# Fetch
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

# Install key
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

# Installs latest available Jenkins
yum -y install jenkins

# Start Jenkins automatically on OS startup
chkconfig jenkins --level 345 on

# Start Jenkins
service jenkins start
