# Getting Started

Obtain the source

    git clone https://github.com/fastnsilver/cibox.git
    
You start by generating a base VM.  Base VM variants may be found in `base-vm` folder.

To list available variants

    cd base-vm
    ls -la
    
    
## Prepare base-vm (optional)

If you choose to build a Red Hat Enterprise Linux version of the `base-vm` you will need to authenticate to the Red Hat Customer Portal.  

Change directories to appropriate `rhel` prefixed `scripts` sub-folder

Edit and save the following as `rhcp.properties`

    # Red Hat Customer Portal credentials
    # Used to register RHEL 7 and add repos via subscription-manager
    username=<rhcp_username>
    password=<rhcp_password>

Above substitute valid Red Hat Customer Portal account credentials for

    <rhcp_username>
    <rhcp_password>

Finally, you'll want to download the [RHEL 7.0 Binary DVD](https://access.redhat.com/downloads/content/69/ver=/rhel---7/7.0/x86_64/product-downloads) and place it in a directory called `iso` underneath the `rhel` directory.
    * Red Hat sure makes it difficult to `curl` or `wget` images from their Customer Portal!


## Build base-vm

### with Packer

    packer build <packer_filename>.json

`<packer_filename>` is the name of the build file used by [Packer](http://www.packer.io/docs/command-line/introduction.html).

### the end result...
You will have a base box for use with Vagrant.


## Build factory-vm

To create a factory VM, review the variants available in the `factory-vm` folder.

Change directories and run `vagrant up`

E.g., to create a RHEL 7.0 factory VM

    cd factory-vm/rhel7
    vagrant up


## Use factory-vm

The following services are available via your web browser of choice:

    http:\\localhost:<port>

* Stash `port 7990`
* JIRA `port 9080`
* Go `port 8153`
* Jenkins `port 8080`
* Docker Registry `port 5000`

You can ssh into your VM w/ Vagrant by opening a shell and typing:

    vagrant ssh
