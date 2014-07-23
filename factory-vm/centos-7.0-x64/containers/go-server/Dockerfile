################################################################################
#
# Go Server
#
#    docker build -rm=true -t fans/go-server .
#    CONTAINER=$(docker run -d -p 8153:8153 -t fans/go-server)
#    ssh -X -l go-server -p 8153 localhost
#
################################################################################

FROM        fans/oracle7jdk:latest
MAINTAINER  Chris Phillipson <fastnsilver@gmail.com>


ENV 	GO_SERVER_VERSION 14.2.0-377
ENV 	JAVA_HOME /usr/java/default/

RUN 	wget download.go.cd/gocd-rpm/go-server-$GO_SERVER_VERSION.noarch.rpm

RUN		yum --nogpgcheck -y localinstall go-server-$GO_SERVER_VERSION.noarch.rpm

RUN 	rm -f go-server-$GO_SERVER_VERSION.noarch.rpm

EXPOSE 8153 8154
