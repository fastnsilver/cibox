# Basics
#
FROM centos:centos7
MAINTAINER Chris Phillipson <fastnsilver@gmail.com>
RUN yum update
RUN yum install -y xmlstarlet software-properties-common python-software-properties

# Configure YUM to exclude postgres in favor of local installation
RUN sed "$ a\exclude=postgresql*" /etc/yum/pluginconf.d/rhnplugin.conf

# Install PGDG RPM file 
RUN yum -y localinstall http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-redhat93-9.3-2.noarch.rpm

# Install PostgreSQL 
yum -y install postgresql93-server

# Setup volume handling
RUN /usr/sbin/groupadd atlassian
ADD own-volume.sh /usr/local/bin/own-volume
RUN echo "%atlassian ALL=NOPASSWD: /usr/local/bin/own-volume" >> /etc/sudoers
RUN mkdir -p /opt/atlassian-home

# Add common script functions
ADD common.bash /usr/local/share/atlassian/common.bash
RUN chgrp atlassian /usr/local/share/atlassian/common.bash
RUN chmod g+w /usr/local/share/atlassian/common.bash

CMD ["/launch"]