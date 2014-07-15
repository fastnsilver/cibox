# Base VM Generation
---

## Overview

This readme documents the implementation details for Base VM Generation.  We use [Vagrant](http://www.vagrantup.com) for VM creation. But, Vagrant [relies on pre-built minimal VM images to create new VMs from](http://docs.vagrantup.com/v2/boxes/base.html).  Unfortunately Vagrant does not provide automation for this task.  For creating base VMs (base-boxes) we need another tool - Veewee. __***Note: There is another tool we may chose to improve this part of the workflow called [Packer](http://www.packer.io).  It is still under consideration*__


### Veewee for Creating Base VMs

[Veewee](https://github.com/jedi4ever/veewee) is a tool created to fill the gap left by Vagrant.  It provides and abstraction over vendor-specific Virtualization technologies and software provisioning strategies to provide a more consistent way of describing and building a base VM from an operating system ISO.  In this case we are using VirtualBox as the virtualization tool to do the initial creation of the VM (driven by Veewee) and shell scripts to install (provision) the base software.  The basic workflow is captured in driver scripts in the `bin` directory desribed as follows:

1. Veewee tells VirtualVBox (presumably via VBoxManage command line behind the scenes) to create the VM using information from `definitions.rb`
2. Veewee tells VirtualBox where the ISO is with the OS distribution and provides (in the RHEL/CentOS case) a Kickstart file to allow for unattended OS initial installation and configuration.
3. Once the VM is created, Veewee tells VirtualBox to add the VM as a box for Vagrant to use later to create other VMs
4. The build script calls VBoxManage to export the VirtualBox VM to a portable OVF file for import to VMWare (in case it needs to be iported into vSphere)

<p align="center">![Base Box Flow](docs/images/base-box-flow.png "Basic Workflow - Generating a base-box")


### VM Definitions 
This project currently supports the creation of two types of base-boxes.  Each is described by a definitions.rb Ruby file.  

* [RedHat Enterprise Linux (RHEL) - definitions.rb](definitions/rhel7-server-x64-base/definitions.rb)
* [Centos - definitions.rb](definitions/centos7-server-x64-base/definitions.rb)

The for each base-box the `definitions.rb` file describes:

* The basic VM setup:
	* Hard Disk size/type
	* Number of CPUs
	* Amount of Memory
	* Basic Networking
	* OS Type
	* Where the ISO is	
*  Security
	* SSL Credentials
* OS Install Configuration
	* For RedHat and Centos this is a [Kickstart file](definitions/rhel7-server-x64-base/ks.cfg) . The Kickstart file's role is described below
* Software to install
	* For the Linux case we use a collection of shell script files.  Veewee iterates over the collection of script files and executes them inside the VM to install software.  See the details in Post Install Files section below


#### Kickstart Files

[Kickstart](http://fedoraproject.org/wiki/Anaconda/Kickstart) files are RedHat's way of doing unattended OS installation and configuration.  There are basically three ways to create a Kickstart file:

* Obtain one already created somewhere else and modify it
* If you know the syntax simply author one
* Manually (interactively) install CentOS or RHEL - configure it - and a Kickstart file will be generated in the root of the filesystem  

The kickstart file for the base-box VM (RHEL) is [ks.cfg](definitions/rhel7-server-x64-base/ks.cfg).  The Kickstart file does the following:

* Tells the bootloader to install instead of upgrade
* Configures the keyboard layout
* Configures the network
* Sets the (encryped) root password
* Disables the firewall (for now)
* Enables shadow passwords
* Disables SELinux (for now)
* Set the timezone (for the factory we use PST)
* Configures the location to Master Boot Record (mbr)
* Forces the kickstart installation to run in text mode
* Configures autopartition
* Installs sudo
* Creates the veewee group/user and adds it to the sudoers file

After the basic creation of the VM and installation of the OS Veewee uploads and runs the postinstall_files (scripts) to provision any software in the VM.

#### Post Install Files (Software Provisioning)

Since RHEL and CentOS come from the same codebase their configuration is nearly identical.  The main difference is we don't register CentOS with RedHat Customer Portal and we don't subscribe to RHEL specific repositories.

In `definitions.rb` the postinstall_files section specifies what scripts to run after the VM comes up.  This only happens during construction of the VM.

The current base-box definitions perform the following software installation and system configurations:

##### rhcp.sh
* RHEL only - sets the credentials for the RedHat Customer Portal registration (*not checked into Git*)

##### base.sh
* RHEL only
	* Registers the image with the RedHat Customer Portal sourcing the credentials from rhcp.sh
	* Sets up subscriptions to RedHat specific YUM repositories:
		* **rhel-7-server-optional-rpms** - needed to get docker-registry
		* **rhel-7-server-extras-rpms** - needed to get various RedHad reviewed RPMs
		* **rhel-7-server-thirdparty-oracle-java-rpms** - so we can use the official Java RPMs from Oracle
* Installs the following minimal packages:
	* **bzip2** - Many tar archives are compressed as bz2.  This allows tar to decompress them
	* **gcc-c++** - needed for building from source
	* **make** - needed for building from source
	* **kernel-devel-rhel** - needed for building VirtualBox Guest Additions
	* **linux-kernel-headers** - needed for building VirtualBox Guest Additions 
	* **zlib-devel** - needed for building various packages including Git
	* **openssl-devel** - needed for TBD
	* **readline-devel** - needed for TBD
	* **sqlite-devel** - needed for TBD
	* **perl** - needed for TBD
	* **wget** - needed to download source packages and other binary dependencies
	* **dkms** - Dynamic Kernal Module Support - neeed to build VirtualBox Guest Additions
	* **nfs-utils** - neeed to build VirtualBox Guest Additions
* Installs X-Windows
	* Yum install **X-Windows System** (group) - neeed to build VirtualBox Guest Additions
* Performs System Configurations:
	* Add the veewee user:group - so veewee can provision software
	* Add veewee to sudoers file - so veewee can provision software 
	* Configure ssh to not use DNS	- we can't rely on DNS in all deployment environments

##### git.sh
* Builds and installs Git from source - All factory boxes will use Git in some way

##### docker.sh
* Installs [Docker](http://www.docker.com) from the EPEL YUM repo - Docker will be used to package and deploy CI applications (as well as by pipelined automated deployments for integration testing)
* Configures the docker service to start a system start

##### vagrant.sh
This script sets up and configures [Vagrant](http://www.vagrantup.com) support

* Adds the vagrant user:group so vagrant provision software
* Adds vagrant user to the wheel group
* Adds vagrant to sudoers file
* Configures vagrant ssh keys (**TODO: Need to bring this in-house quickly!**)

##### virtualbox.sh
* Builds and installs the VirtualBox Guest Additions by using an ISO mount - this is needed for exporting to the OVF portable VM format

##### zerodisk.sh
* Zeros out the empty space on the VM hard disk to conserve space

##### cleanup.sh
* Removes any un-needed yum repo files
* Remove all uploaded shell scripts and credentials files
* Remove the MAC address from the network configuration

### Next Steps

Once a base-box is created and added to Vagrant, other automation processes can do the work of creating application-specific VMs.  The first application-specific VM to be created is the "factory-vm"
