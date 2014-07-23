
FROM fans/postgresql94:latest
MAINTAINER Chris Phillipson <fastnsilver@gmail.com>

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
ADD common.bash /usr/local/share/atlassian/common.bash
RUN chgrp atlassian /usr/local/share/atlassian/common.bash
RUN chmod g+w /usr/local/share/atlassian/common.bash
