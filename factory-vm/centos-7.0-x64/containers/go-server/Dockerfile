################################################################################
#
# Go Server
#
#    docker build -rm=true -t factory/go-server .
#    CONTAINER=$(docker run -d -p 8153:8153 -t factory/go-server)
#    ssh -X -l go-server -p 8153 localhost
#
################################################################################

FROM        factory/oracle7jdk:latest
MAINTAINER  Chris Phillipson <fastnsilver@gmail.com>

# Install ThoughtWorks Go
ENV 	GO_SERVER_VERSION 14.2.0-377

# Fetch RPMs
## Server
RUN 	wget download.go.cd/gocd-rpm/go-server-$GO_SERVER_VERSION.noarch.rpm
## Agent
RUN 	wget download.go.cd/gocd-rpm/go-agent-$GO_SERVER_VERSION.noarch.rpm

# Install server and agent
RUN		yum --nogpgcheck -y localinstall go-server-$GO_SERVER_VERSION.noarch.rpm
RUN		yum --nogpgcheck -y localinstall go-agent-$GO_SERVER_VERSION.noarch.rpm

# Start go-agent and go-server automatically on OS startup
RUN		chkconfig go-server --level 345 on
RUN		chkconfig go-agent --level 345 on
