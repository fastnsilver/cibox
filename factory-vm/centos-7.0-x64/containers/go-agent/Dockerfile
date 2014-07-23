################################################################################
#
# Go Agent
#
#    docker build -rm=true -t fans/go-agent .
#    CONTAINER=$(docker run -d -p 8154:8154 -t fans/go-agent -e SERVER_PORT_8153_TCP_ADDR=localhost -e SERVER_PORT_8153_TCP_PORT=8153)
#    ssh -X -l go-agent -p 8154 localhost
#
################################################################################

FROM        fans/oracle7jdk:latest
MAINTAINER  Chris Phillipson <fastnsilver@gmail.com>


ENV 	GO_AGENT_VERSION 14.2.0-377
ENV 	JAVA_HOME /usr/java/default/

RUN 	wget download.go.cd/gocd-rpm/go-agent-$GO_AGENT_VERSION.noarch.rpm

RUN		yum --nogpgcheck -y localinstall go-agent-$GO_AGENT_VERSION.noarch.rpm

RUN 	rm -f go-agent-$GO_AGENT_VERSION.noarch.rpm

RUN 	sed -r -i "s/^(GO_SERVER)=(.*)/\1=\$SERVER_PORT_8153_TCP_ADDR/g" /etc/default/go-agent

VOLUME 	["/var/lib/go-agent"]
