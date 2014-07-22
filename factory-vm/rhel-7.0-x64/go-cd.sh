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
yum --nogpgcheck -y localinstall go-server-$VERSION.noarch.rpm
yum --nogpgcheck -y localinstall go-agent-$VERSION.noarch.rpm

# Start go-agent and go-server automatically on OS startup
chkconfig go-server --level 345 on
chkconfig go-agent --level 345 on

# Start go-agent and go-server
service go-server start
service go-agent start