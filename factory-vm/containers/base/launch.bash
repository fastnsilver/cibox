#!/bin/bash

# Install PostgreSQL
# See https://wiki.postgresql.org/wiki/YUM_Installation

# Become root
sudo -i

# Post install commands
# Note: data directory will be /var/lib/pgsql/9.3/data
service postgresql-9.3 initdb

# Start PostgreSQL automatically on OS startup
chkconfig postgresql-9.3 on