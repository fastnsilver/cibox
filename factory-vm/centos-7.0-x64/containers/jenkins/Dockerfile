################################################################################
#
# Jenkins
#
#    docker build -rm=true -t fans/jenkins .
#    CONTAINER=$(docker run -d -p 8080:8080 -t fans/jenkins)
#    ./docker-enter -u jenkins $CONTAINER
#
################################################################################


FROM        fans/oraclejdk8:latest
MAINTAINER  Chris Phillipson <fastnsilver@gmail.com>


ENV 	JAVA_HOME /usr/java/default/

RUN 	yum install -y wget && \
			wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo && \
			rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key && \
			yum -y install jenkins

EXPOSE 	8080

ADD     etc/supervisor/conf.d/jenkins.conf /etc/supervisor/conf.d/jenkins.conf
