#!/bin/bash

# Post install commands
# Note: data directory will be /var/lib/pgsql/9.4/data
/usr/pgsql-9.4/bin/initdb

# Start PostgreSQL automatically on OS startup
systemctl enable postgresql-9.4.service
systemctl start postgresql-9.4.service