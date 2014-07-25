#!/bin/bash

##################################################
# BASE VM BUILD
##################################################

usage()
{
cat << EOF
usage: $0 [-d distro] [-h] [-l] [-p provider]

This script will build a base virtual machine employing Packer
that will be exported as a "base box" and added to Vagrant.

OPTIONS:

    -h      Help (displays this usage information)
    -d      Linux distribution 
    -l      List supported distributions and providers
    -p      Virtual machine provider

EXAMPLES:

    ./build.sh -h
        Displays Help

    ./build.sh -d centos-7.0-x64 -p virtualbox
        Builds a CentOS 7.0 base VM using Oracle Virtual Box provider

    ./build.sh -l
        List supported distributions and providers
EOF
}

DISTRO=
PROVIDER=
LIST=
while getopts "h:d:p:l" OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         d)
             DISTRO=$OPTARG
             ;;
         p)
             PROVIDER=$OPTARG
             ;;
         l)
             cat vm.info
             LIST=$OPTARG
             exit
             ;;
         ?)
             usage
             exit
             ;;
     esac
done

if [[ -z $DISTRO ]] || [[ -z $PROVIDER ]] 
then
     usage
     exit 1
else 
     SAVEPATH=`pwd`
     SCRIPTPATH=`dirname $0`
     pushd $SAVEPATH > /dev/null
     cd $SCRIPTPATH
     cd $DISTRO
     packer --version
     vagrant version
     packer inspect ${DISTRO}_${PROVIDER}.json
     packer build -force ${DISTRO}_${PROVIDER}.json
     vagrant box add --force --provider=${PROVIDER} --name="$DISTRO" ${DISTRO}_${PROVIDER}.box
popd > /dev/null
fi