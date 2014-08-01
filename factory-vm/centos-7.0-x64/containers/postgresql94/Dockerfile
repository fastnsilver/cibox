################################################################################
#
# PostgreSQL 9.4
#
#    docker build -rm=true -t fans/postgresql94 .
#    CONTAINER=$(docker run -d -p 2000:22 -p 5432:5432 -t fans/postgresql94)
#    ssh -X -l docker -p 2000 localhost
#
################################################################################

## @see https://github.com/cthulhuology/docker-postgresql/blob/master/Dockerfile

FROM fans/oraclejdk8:latest
MAINTAINER Chris Phillipson <fastnsilver@gmail.com>

# Configure YUM to exclude postgres in favor of local installation
RUN sed "/\[base\]/a\exclude=postgresql*" /etc/yum.repos.d/CentOS-Base.repo
RUN sed "/\[updates\]/a\exclude=postgresql*" /etc/yum.repos.d/CentOS-Base.repo

# Install PGDG RPM file 
RUN yum -y localinstall http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-1.noarch.rpm

# Install PostgreSQL 
RUN yum -y install postgresql94-server postgresql94-contrib


RUN 	su - postgres -c '/usr/pgsql-9.4/bin/initdb -D /var/lib/pgsql/data'

# Set permissions to allow logins, trust the bridge, this is the default for docker YMMV
RUN echo "host all  all    0.0.0.0/0  md5" >> /var/lib/pgsql/data/pg_hba.conf

# Listen on all interfaces
RUN echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

ADD     etc/supervisor/conf.d/postgresql94.conf /etc/supervisor/conf.d/postrgresql94.conf
