#!/bin/bash

SAVEPATH=`pwd`
SCRIPTPATH=`dirname $0`
pushd $SAVEPATH > /dev/null
cd $SCRIPTPATH
cd ..
DISTRO="centos-7.0-x64"
cd $DISTRO
TEMPLATE=${DISTRO}_virtualbox
packer --version
packer inspect ${TEMPLATE}.json
packer build -force ${TEMPLATE}.json
popd > /dev/null

