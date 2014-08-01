#!/bin/bash

# From the trimmed down blog post, db creation is automated
# ---------------------------------------------------------
# We need to note down the IP address of the container so
# that we can wire it up to Stash later:
# 
#     sudo docker inspect postgres | grep IPAddress
# 
# Note down the IP Address. To test that PostgreSQL is running you can can
# connect to it easily with (password: docker):
# 
#     psql -h <ip-address-noted> -d docker -U docker -W
# 
# (You may need to install the sql client with: `sudo apt-get install
# postgresql-client`).
# 
# We'll need to setup databases for Stash, if you want to do it now
# at the `psql` shell type:
# 
#     
#     CREATE ROLE stashuser WITH LOGIN PASSWORD 'jellyfish' VALID UNTIL 'infinity';
#     CREATE DATABASE stash WITH ENCODING='UTF8' OWNER=stashuser TEMPLATE=template0 CONNECTION LIMIT=-1;
# 
# The above creates `stash` database with `stashuser` user and password `jellyfish`. 
# --------------------------------------------------------


# Creates Stash database and user

# Get IP Address of postgres container
#PSQL_IP=$(sudo docker inspect postgres | grep IPAddress| cut -d '"' -f4)
PSQL_IP=$DB_PORT_5432_TCP_ADDR
PSQL_PORT=$DB_PORT_5432_TCP_PORT

# Saves password
echo "$PSQL_IP:*:*:docker:docker" > $HOME/.pgpass
chmod 0600 $HOME/.pgpass

echo "
CREATE ROLE stashuser WITH LOGIN PASSWORD 'jellyfish' VALID UNTIL 'infinity';
CREATE DATABASE stash WITH ENCODING='UTF8' OWNER=stashuser TEMPLATE=template0 CONNECTION LIMIT=-1;" \
| PGPASSWORD="docker" psql -h $PSQL_IP -p $PSQL_PORT -d docker -U docker -w
