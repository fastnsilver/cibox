################################################################################
#
# Go Server
#
#    docker build -rm=true -t fans/go-agent .
#    CONTAINER=$(docker run -d -p 8154:8154 -t fans/go-agent)
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

CMD 	/usr/java/default/bin/java -jar /usr/share/go-agent/agent-bootstrapper.jar $SERVER_PORT_8153_TCP_ADDR $SERVER_PORT_8153_TCP_PORT
