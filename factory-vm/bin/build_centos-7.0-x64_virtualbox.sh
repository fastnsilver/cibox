#!/bin/sh

DIST=centos-7.0-x64
TEMPLATE=$DIST_virtualbox
cd ../$DIST

vagrant -v
vagrant box add --name ../../base-vm/$DIST/$TEMPLATE.box -f
vagrant up 
