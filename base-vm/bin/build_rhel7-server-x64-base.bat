cd ..

veewee vbox build 'rhel7-server-x64-base' 

veewee vbox validate 'centos7-server-x64-base' 

veewee vbox export 'rhel7-server-x64-base' 

vagrant box add rhel7-server-x64-base rhel7-server-x64-base.box

VBoxManage export rhel7-server-x64-base --output rhel7-server-x64-base.ovf
