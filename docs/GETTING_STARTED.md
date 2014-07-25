# Getting Started

Obtain the source

    git clone https://github.com/fastnsilver/cibox.git
    
You start by generating a base VM.  Base VM variants may be found in `base-vm` folder.

## To list available variants

    cd base-vm

### Mac OS X / Linux
    
    ./build.sh -l

### Windows

    build.bat -l


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

### Mac OS X / Linux

    ./build.sh -h

### Windows 

    build.bat -h

E.g., to build a CentOS 7.0 base-vm (on Windows with VirtualBox) 

    build.bat -d centos-7.0-x64 -p virtualbox

### the end result...
You will have a base box for use with Vagrant.


## Build factory-vm

To create a factory VM, review the variants available in the `factory-vm` folder.

Change directories and run `vagrant up --provider=<provider>`

E.g., to create a RHEL 7.0 factory VM (with VirtualBox provider, assuming you've built base-vm)

    cd factory-vm/rhel-7.0-x64
    vagrant up --provider=virtualbox


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
