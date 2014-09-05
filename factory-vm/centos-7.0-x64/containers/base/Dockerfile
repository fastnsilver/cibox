################################################################################
#
# Factory base container: 
#	 YUM configuration, fundamental packages.
#
#    docker build -rm=true -t fans/factory-base .
#
# 	 Not meant to be run, rather provide a common set of features for derivative 
#    containers
#
################################################################################

FROM centos:centos7
MAINTAINER Chris Phillipson <fastnsilver@gmail.com>

RUN 	yum -y update && \
			yum install -y sudo python-setuptools && \
	 		easy_install pip && \
			pip install supervisor && \
			mkdir -p /var/log/supervisor

ADD		supervisord.conf /etc/

VOLUME	/var/log/supervisor
CMD     ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
