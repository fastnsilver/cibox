# Getting Started

Obtain the source

    git clone https://github.com/fastnsilver/cibox.git
    
You start by generating a base VM.  Base VM definitions may be found in `base-vm/definitions` folder.

To list available definitions

    cd base-vm
    veewee vbox list
    
    
## Prepare base-vm (optional)

If you choose to build a Red Hat Enterprise Linux version of the `base-vm` you will need to authenticate to the Red Hat Customer Portal.  

Place yourself within the definitions sub-folder

    cd base-vm/definitions

Then change directories to appropriate `rhel` prefixed sub-folder

Edit and save the following as `rhcp.sh`

    # Create .properties file that will encapsulate Red Hat Customer Portal credentials
    # File will be used by base.sh to register RHEL 7 and add repos via subscription-manager
    VEEWEE_HOME=/home/veewee
    cat > $VEEWEE_HOME/rhcp.properties << EOM
    username=<rhcp_username>
    password=<rhcp_password>
    EOM

    # Bestow permissions 
    chown veewee:veewee $VEEWEE_HOME/rhcp.properties

Above substitute valid Red Hat Customer Portal account credentials for

    <rhcp_username>
    <rhcp_password>

Finally, you'll want to download the [RHEL 7.0 Binary DVD](https://access.redhat.com/downloads/content/69/ver=/rhel---7/7.0/x86_64/product-downloads) and place it in a directory called `iso` underneath the `base-vm` directory.
    * Red Hat sure makes it difficult to `curl` or `wget` images from their Customer Portal!


## Build base-vm

### with Script
To create and export a base VM, run one of the available scripts in the `base-vm/bin` folder.

E.g., to create and export a RHEL 7.0 base VM, run

on Linux / Mac OS X

    build_rhel7-server-x64-base.sh
    
on Windows

    build_rhel7-server-x64-base.bat    

### with Gradle
You can also use Gradle to build, see [Gradle Builds](../base-vm/docs/GRADLE-BUILDS.md)

### the end result...
You will have a base box for use with Vagrant.


## Build factory-vm

To create a factory VM, review the variants available in the `factory-vm/var` folder.

Change directories and run `vagrant up`

E.g., to create a RHEL 7.0 factory VM

    cd factory-vm/var/rhel7
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
