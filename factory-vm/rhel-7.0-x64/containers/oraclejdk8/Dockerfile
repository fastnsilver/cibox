################################################################################
#
# Oracle JDK 8
#
#    docker build -rm=true -t fans/oraclejdk8 .
#    CONTAINER=$(docker run -d -p 2000:22 -t fans/oraclejdk8)
#    ssh -X -l docker -p 2000 localhost
#
################################################################################

FROM        fans/factory-base:latest
MAINTAINER  Chris Phillipson <fastnsilver@gmail.com>

# Install Oracle JDK 8

# Installs 1.8.0_xx version
# @see http://lalyos.github.io/blog/2014/03/18/oracle-jdk-7-on-centos/
RUN 	curl -LO 'http://download.oracle.com/otn-pub/java/jdk/8u11-b12/jdk-8u11-linux-x64.rpm' \
		-H 'Cookie: oraclelicense=accept-securebackup-cookie'

RUN 	yum --nogpgcheck -y localinstall jdk-8u11-linux-x64.rpm

# Set alternatives and JAVA_HOME
# @see http://serverfault.com/questions/50883/what-is-the-value-of-java-home-for-centos
RUN 	alternatives --install /usr/bin/java java /usr/java/default/bin/java 999999 \
           --slave /usr/bin/keytool keytool /usr/java/default/bin/keytool \
           --slave /usr/bin/rmiregistry rmiregistry /usr/java/default/bin/rmiregistry

RUN 	alternatives --install /usr/bin/javac javac /usr/java/default/bin/javac 999999 \
           --slave /usr/bin/jar jar /usr/java/default/bin/jar \
           --slave /usr/bin/rmic rmic /usr/java/default/bin/rmic

RUN 	echo "export JAVA_HOME=/usr/java/default/" > /etc/profile.d/java_home.sh
