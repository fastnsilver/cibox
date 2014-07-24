#!/bin/sh

DIST=rhel-7.0-x64
TEMPLATE=$DIST_vmware
cd ../$DIST

packer --version
packer inspect $TEMPLATE.json
packer validate $TEMPLATE.json
packer build -force $TEMPLATE.json