################################################################################
#
# Atlassian product base
#
#    docker build -rm=true -t fans/atlassian .
#    CONTAINER=$(docker run -d -p 2000:22 -t fans/atlassian --name db)
#    ssh -X -l docker -p 2000 localhost
#
################################################################################

FROM fans/postgresql94:latest
MAINTAINER Chris Phillipson <fastnsilver@gmail.com>

ENV PGDATA /var/lib/pgdata

RUN yum -y update
RUN yum -y install bzip2 tar wget
RUN wget http://apt.sw.be/redhat/el6/en/x86_64/rpmforge/RPMS/xmlstarlet-1.5.0-1.el6.rf.x86_64.rpm
RUN yum -y localinstall xmlstarlet-1.5.0-1.el6.rf.x86_64.rpm


# Setup volume handling
RUN /usr/sbin/groupadd atlassian
ADD own-volume.sh /usr/local/bin/own-volume
RUN echo "%atlassian ALL=NOPASSWD: /usr/local/bin/own-volume" >> /etc/sudoers
RUN mkdir -p /opt/atlassian-home

# Add common script functions
ADD common.sh /usr/local/share/atlassian/common.sh
RUN chgrp atlassian /usr/local/share/atlassian/common.sh
RUN chmod g+w /usr/local/share/atlassian/common.sh
