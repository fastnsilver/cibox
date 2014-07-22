# Frequently Asked Questions

A collection of commonly asked questions with answers to help with troubleshooting a "CI in a Box" installation.


## About base-vm

### Q: How do I list available base-vm variants?

A: Open a shell. `cd base-vm`. Execute `ls -la`.


### Q: How do I remove a base-vm I just created?

A: Open a shell. `cd base-vm`. Then `rm -f <vbox_name>.box` where `<vbox_name>` is the name of the base VM.  

E.g., `rm -f centos-7.0-x64.box`.


### Q: How do I remove an existing Vagrant base box ?

A: Open a shell. Execute `vagrant global-status`.  Review list. Select id. 

Execute `vagrant destroy <id>` where `<id>` is the id of the base box you want to remove.


## About factory-vm

### Q: How do I list available factory-vms?
  
A: Open a shell. `cd factory-vm`. Review sub-folders.


### Q: How do I shutdown a running factory-vm?

A: Open a shell. Execute `vagrant global-status`.  Review list. Select id. 

Execute `vagrant halt <id>` where `<id>` is the id of the base box you want to shutdown.
