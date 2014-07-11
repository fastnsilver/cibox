# Install ThoughtWorks Go
VERSION=14.2.0-377
# Become root
sudo -i

# Fetch RPMs
## Server
wget download.go.cd/gocd-rpm/go-server-$VERSION.noarch.rpm
## Agent
wget download.go.cd/gocd-rpm/go-agent-$VERSION.noarch.rpm

# Install server and agent
yum -y localinstall go-server-$VERSION.noarch.rpm
yum -y localinstall go-agent-$VERSION.noarch.rpm

# Start go-agent and go-server automatically on OS startup
chkconfig go-server on
chkconfig go-agent on

# Start go-agent and go-server
service go-server start
service go-agent start