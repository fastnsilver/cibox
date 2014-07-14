# Getting Started

Obtain the source

    git clone https://github.com/fastnsilver/cibox.git
    
You start by generating a base VM.  Base VM definitions may be found in `base-vm/definitions` folder.

To list available definitions

    cd base-vm
    veewee vbox list
    

## Build base-vm

To create and export a base VM, run one of the available scripts in the `base-vm/bin` folder.

E.g., to create and export a RHEL 7.0 base VM, run

on Linux / Mac OS X

    build_rhel7-server-x64-base.sh
    
on Windows

    build_rhel7-server-x64-base.bat    

Now you have a base box for use with Vagrant.


## Build factory-vm

To create a factory VM, review the variants available in the `factory-vm/var` folder.

Change directories and run `vagrant up`

E.g., to create a RHEL 7.0 factory VM

    cd factory-vm
    cd var
    cd rhel7
    vagrant up
