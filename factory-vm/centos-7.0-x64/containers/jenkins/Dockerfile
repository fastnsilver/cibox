# Install Jenkins

FROM        fans/oracle7jdk:latest
MAINTAINER  Chris Phillipson <fastnsilver@gmail.com>


ENV 	JAVA_HOME /usr/java/default/


# Fetch
RUN 	wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

# Install key
RUN		rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

# Installs latest available Jenkins
RUN		yum -y install jenkins

# Start Jenkins automatically on OS startup
RUN 	systemctl enable jenkins.service

EXPOSE 8080

# Start Jenkins
CMD	["service jenkins start"]