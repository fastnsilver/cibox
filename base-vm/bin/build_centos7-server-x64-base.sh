#!/bin/bash
cd ..

veewee vbox build 'centos7-server-x64-base'

veewee vbox export 'centos7-server-x64-base'

vagrant box add centos7-server-x64-base centos7-server-x64-base.box