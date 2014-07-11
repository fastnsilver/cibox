#!/bin/bash
cd ..

veewee vbox build 'rhel7-server-x64-base'

veewee vbox export 'rhel7-server-x64-base'

vagrant box add rhel7-server-x64-base rhel7-server-x64-base.box