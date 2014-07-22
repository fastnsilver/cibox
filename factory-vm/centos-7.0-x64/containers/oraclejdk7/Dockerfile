################################################################################
#
# OpenJDK 7
#
#    docker build -rm=true -t factory/oraclejdk7 .
#    CONTAINER=$(docker run -d -p 2000:22 -t factory/oraclejdk7)
#    ssh -X -l factory -p 2000 localhost
#
################################################################################

FROM        factory/base:latest
MAINTAINER  Chris Phillipson <fastnsilver@gmail.com>

# Install Oracle JDK 7

# Installs 1.7.0_xx version
# from http://lalyos.github.io/blog/2014/03/18/oracle-jdk-7-on-centos/
RUN 	curl -LO 'http://download.oracle.com/otn-pub/java/jdk/7u60-b19/jdk-7u60-linux-x64.rpm' \
		-H 'Cookie: oraclelicense=accept-securebackup-cookie'

RUN 	yum --nogpgcheck -y localinstall jdk-7u60-linux-x64.rpm