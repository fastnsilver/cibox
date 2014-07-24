#!/bin/sh

TS=$(date +"%Y%m%d%H%M%S.%N")

DIST=rhel-7.0-x64
TEMPLATE=$DIST_virtualbox
cd ../../$DIST

vagrant -v
vagrant box add -f --name=$TEMPLATE --provider=virtualbox ../../base-vm/$DIST/$TEMPLATE.box
vagrant up --provider=virtualbox
