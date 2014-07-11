# Basics
#
FROM rhel-server-docker-7.0-21.4.x86_64
MAINTAINER Chris Phillipson <fastnsilver@gmail.com>
RUN yum update
RUN yum install -y xmlstarlet software-properties-common python-software-properties

# Setup volume handling
RUN /usr/sbin/groupadd atlassian
ADD own-volume.sh /usr/local/bin/own-volume
RUN echo "%atlassian ALL=NOPASSWD: /usr/local/bin/own-volume" >> /etc/sudoers
RUN mkdir -p /opt/atlassian-home

# Add common script functions
ADD common.bash /usr/local/share/atlassian/common.bash
RUN chgrp atlassian /usr/local/share/atlassian/common.bash
RUN chmod g+w /usr/local/share/atlassian/common.bash