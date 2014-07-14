# "CI in a Box" Virtual Machine Providers

"CI in a Box" relies on [Veewee](https://raw.githubusercontent.com/jedi4ever/veewee/master/doc/providers.md)) to provision VMs.  

Veewee supports [VirtualBox](https://www.virtualbox.org/) (among others) quite well; so one may [export](https://www.virtualbox.org/manual/ch08.html#vboxmanage-export) to `.ovf`, a standard, portable [format](http://en.wikipedia.org/wiki/Open_Virtualization_Format).


## Exporting with VBoxManage

    VBoxManage export <your_vbox> --output <your_vbox>.ovf
    
    
## Importing to VMWare Player

    // TODO
    
    
## Uploading to VMWare vCloud
    
    // TODO
    