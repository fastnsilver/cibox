# Basics
#
FROM rhel-server-docker-7.0-21.4.x86_64
MAINTAINER Chris Phillipson <fastnsilver@gmail.com>
RUN yum -y update
RUN yum -y install bzip2 tar wget
RUN wget http://apt.sw.be/redhat/el6/en/x86_64/rpmforge/RPMS/xmlstarlet-1.5.0-1.el6.rf.x86_64.rpm
RUN yum -y localinstall xmlstarlet-1.5.0-1.el6.rf.x86_64.rpm

# Configure YUM to exclude postgres in favor of local installation
RUN sed "$ a\exclude=postgresql*" /etc/yum/pluginconf.d/rhnplugin.conf

# Install PGDG RPM file 
RUN yum -y localinstall http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-redhat93-9.3-2.noarch.rpm

# Install PostgreSQL 
RUN yum -y install postgresql93-server

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