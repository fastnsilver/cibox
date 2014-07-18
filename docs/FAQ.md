# Frequently Asked Questions

A collection of commonly asked questions with answers to help with troubleshooting a "CI in a Box" installation.


## About base-vm

### Q: How do I list available base-vm definitions?

A: Open a shell. `cd base-vm`. Execute `veewee vbox list`.


### Q: How do I shutdown a running base-vm?

A: Open a shell. `veewee vbox halt <vboxx_name>` where `<vbox_name>` is the name you gave to the VM.  

E.g., `veewee vbox halt centos7-server-x64-base`.


### Q: How do I remove a base-vm I just created?

A: Open a shell. Execute `veewee vbox destroy <vbox_name>` where `<vbox_name>` is the name you gave to the VM.  

E.g., `veewee vbox destroy centos7-server-x64-base`.


### Q: How do I remove an existing Vagrant base box ?

A: Open a shell. Execute `vagrant global-status`.  Review list. Select id. 

Execute `vagrant destroy <id>` where `<id>` is the id of the base box you want to remove.


## About factory-vm

### Q: How do I list available factory-vms?
  
A: Open a shell. `cd factory-vm/var`. Review sub-folders.


### Q: How do I shutdown a running factory-vm?

A: Open a shell. Open a shell. Execute `vagrant global-status`.  Review list. Select id. 

Execute `vagrant halt <id>` where `<id>` is the id of the base box you want to shutdown.
