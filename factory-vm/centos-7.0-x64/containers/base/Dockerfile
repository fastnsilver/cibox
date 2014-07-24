# factory-base

FROM centos:centos7
MAINTAINER Chris Phillipson <fastnsilver@gmail.com>

RUN 	yum -y update
RUN 	yum install -y openssh-server supervisor
RUN 	mkdir -p /var/run/sshd
RUN 	mkdir -p /var/log/supervisor

# PAM configuration breaks SSH logins
RUN     rm /etc/pam.d/sshd

RUN     echo 'X11Forwarding yes' >> /etc/ssh/ssh_config

ADD     etc/supervisor/conf.d/sshd.conf /etc/supervisor/conf.d/sshd.conf
CMD     ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
