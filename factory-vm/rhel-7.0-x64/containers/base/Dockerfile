################################################################################
#
# Factory base container: 
#	 YUM configuration, fundamental packages, docker user and SSH.
#
#    docker build -rm=true -t fans/factory-base .
#    CONTAINER=$(docker run -d -p 2000:22 -t fans/factory-base)
#    ssh -X -l docker -p 2000 localhost
#
################################################################################

FROM rhel:rhel7
MAINTAINER Chris Phillipson <fastnsilver@gmail.com>

# // TODO registration and subscription management required

RUN 	yum -y update
RUN 	yum install -y sudo openssh-server python-setuptools
RUN 	easy_install pip
RUN 	pip install supervisor
RUN 	mkdir -p /var/run/sshd
RUN 	mkdir -p /var/log/supervisor

# PAM configuration breaks SSH logins
RUN     rm /etc/pam.d/sshd

RUN     echo 'X11Forwarding yes' >> /etc/ssh/ssh_config

ADD		supervisord.conf /etc/
ADD     etc/supervisor/conf.d/sshd.conf /etc/supervisor/conf.d/sshd.conf
VOLUME	/var/log/supervisor
CMD     ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
