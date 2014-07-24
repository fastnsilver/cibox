#!/bin/sh

TS=$(date +"%Y%m%d%H%M%S.%N")

DIST=rhel-7.0-x64
TEMPLATE=$DIST_vmware
cd ../../$DIST

vagrant -v
vagrant box add -f --name=$TEMPLATE --provider=vmware_desktop ../../base-vm/$DIST/$TEMPLATE.box
vagrant up --provider=vmware_fusion
