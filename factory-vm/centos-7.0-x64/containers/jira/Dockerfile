################################################################################
#
# JIRA
#
#    docker build -rm=true -t fans/jira .
#    CONTAINER=$(docker run -d -p 2000:22 -p 9080:9080 -t fans/jira --link db:db --link stash:stash)
#    ssh -X -l docker -p 2000 localhost
#
################################################################################

FROM fans/atlassian:latest
MAINTAINER Chris Phillipson <fastnsilver@gmail.com>

# Install Jira

ENV JIRA_VERSION 6.3
RUN curl -Lks http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-${JIRA_VERSION}.tar.gz -o /root/jira.tar.gz
RUN /usr/sbin/useradd --create-home --home-dir /opt/jira --groups atlassian --shell /bin/bash jira
RUN tar zxf /root/jira.tar.gz --strip=1 -C /opt/jira
RUN chown -R jira:jira /opt/atlassian-home
RUN echo "jira.home = /opt/atlassian-home" > /opt/jira/atlassian-jira/WEB-INF/classes/jira-application.properties
RUN chown -R jira:jira /opt/jira
RUN mv /opt/jira/conf/server.xml /opt/jira/conf/server-backup.xml

ENV CONTEXT_PATH ROOT
ADD launch.bash /launch

# Launching Jira

WORKDIR /opt/jira
VOLUME ["/opt/atlassian-home"]

EXPOSE 9080

ADD     etc/supervisor/conf.d/jira.conf /etc/supervisor/conf.d/jira.conf
