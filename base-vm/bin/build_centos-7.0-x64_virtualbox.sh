#!/bin/sh

DIST=centos-7.0-x64
TEMPLATE=$DIST_virtualbox
cd ../$DIST

packer --version
packer inspect $TEMPLATE.json
packer validate $TEMPLATE.json
packer build $TEMPLATE.json
