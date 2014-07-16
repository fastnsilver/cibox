# Requirements

"CI in a Box" has a few requirements that must be met before you're able to use it. The following software should be installed and configured:

* Git >= v1.9.4
* Ruby >= v1.9.3
* Ruby devkit >= v1.9.3
* Vagrant >= v1.6.3
* VirtualBox >= v4.3.12
* Veewee >= v0.3.12
* Packer >= v0.6.0


If you're in a hurry, skip to the relevant sub-section under Quickstarts below.


## Concerns

As of 2014-07-16, VirtualBox 4.3.14 is known to [fail](https://forums.virtualbox.org/viewtopic.php?f=6&t=62615) on Windows platforms. If you follow the Quickstart for Windows below, instead of using Chocolately `cinst virtualbox` , you will need to manually install VirtualBox using these steps:

* Download and install [VirtualBox 4.3.12](http://download.virtualbox.org/virtualbox/4.3.12/VirtualBox-4.3.12-93733-Win.exe)
* Download and install [VirtualBox Extensions](http://download.virtualbox.org/virtualbox/4.3.12/Oracle_VM_VirtualBox_Extension_Pack-4.3.12-93733.vbox-extpack)
* Download patch for [VirtualBox Guest Additions](https://www.virtualbox.org/download/testcase/VBoxGuestAdditions_4.3.13-94832.iso)
    * Rename this file to `VBoxGuestAditions_4.3.12.iso`
    * Make a directory called `iso` underneath the `base-vm` directory
    * Move the file you just renamed into the `iso` directory


## Quickstarts

Attention is focused on three operating system variants: Linux, Mac OS X, and Windows. 


### Linux

    // TODO


### Mac OS X

    // TODO
    
On Macs, either install [Xcode](https://developer.apple.com/xcode/downloads/) or use [Homebrew](http://mxcl.github.io/homebrew/) to install `apple-gcc42` or `build-essential`.


### Windows

The fastest way to get everything you need installed is via [Chocolatey](https://chocolatey.org/)
  
Before you install Chocolatey, be sure to [set](https://github.com/chocolatey/chocolatey/wiki/Installation#before-you-install) the `ChocolateyInstall` environment variable.

Open a `cmd.exe` shell as Administrator, and type:

    @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

Continue installing software packages:

    cinst git
    cinst packer
    cinst ruby1.9
    cinst vagrant
    cinst virtualbox

Continue installing Ruby DevKit: 

* Download [Ruby DevKit](https://github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe).  
* Extract it into new sub-directory named `devkit` underneath the directory where you installed Ruby.
    * In this case it will be in %ChocolateyInstall%/packages/ruby19x
* Open cmd shell. 
* Change directories into the devkit folder. 
* Execute `dk.rb init`
* Execute `dk.rb install`

Continue installing Ruby gems:

    gem install bundler
    gem install veewee
    gem install veewee-to-packer

Verify your Windows `Path` by opening a `cmd.exe` shell and typing: 

    set | grep Path
    
the `bin` directories for `git`, `ruby`, `packer`, `vagrant`, and `virtualbox` should be included in your `Path`


## Verification

For each software package installed, open a shell and type 

* Git `git --version`
* Ruby `ruby -v`
* Vagrant `vagrant -v`
* VirtualBox `VBoxManage`
* Veewee `veewee version`
* Packer `packer --version`


## Up Next

Ok, now that we have covered all the requirements, you can move on to [getting started with "CI in a Box"](GETTING_STARTED.md).
