################################################################################
#
# Stash
#
#    docker build -rm=true -t fans/stash .
#    CONTAINER=$(docker run -d -p 7990:7990 -t fans/stash --name stash --link db:db)
#    ./docker-enter -u stash $CONTAINER
#
################################################################################

FROM fans/atlassian:latest
MAINTAINER Chris Phillipson <fastnsilver@gmail.com>

# Install Stash

ENV STASH_VERSION 3.2.0
RUN curl -Lks http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-${STASH_VERSION}.tar.gz -o /root/stash.tar.gz
RUN /usr/sbin/useradd --create-home --home-dir /opt/stash --groups atlassian --shell /bin/bash stash
RUN tar zxf /root/stash.tar.gz --strip=1 -C /opt/stash
RUN sed -i -e "s/^#!\/bin\/sh/#!\/bin\/bash/" /opt/stash/bin/catalina.sh
RUN mv /opt/stash/conf/server.xml /opt/stash/conf/server-backup.xml
RUN chown -R stash:stash /opt/stash

ADD initialise_stashdb.sh /usr/local/share/atlassian/initialise_stashdb.sh
RUN chgrp atlassian /usr/local/share/atlassian/initialise_stashdb.sh
RUN chmod g+w /usr/local/share/atlassian/initialise_stashdb.sh

ENV CONTEXT_PATH ROOT
ADD launch.sh /launch

# Launching Stash

WORKDIR /opt/stash
VOLUME /opt/atlassian-home

EXPOSE 7990 7999

ADD     etc/supervisor/conf.d/stash.conf /etc/supervisor/conf.d/stash.conf
