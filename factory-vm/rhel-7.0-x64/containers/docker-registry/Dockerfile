################################################################################
#
# Docker Registry
#
#    docker build -rm=true -t fans/docker-registry .
#    CONTAINER=$(docker run -d -p 2000:22 -p 5000:5000 -t fans/docker-registry)
#    ssh -X -l docker -p 2000 localhost
#
################################################################################

FROM        fans/factory-base:latest
MAINTAINER  Chris Phillipson <fastnsilver@gmail.com>

# Install
RUN		yum -y install docker-registry

ADD     etc/supervisor/conf.d/docker-registry.conf /etc/supervisor/conf.d/docker-registry.conf
