# Requirements

"CI in a Box" has a few requirements that must be met before you're able to use it. The following software should be installed and configured:

* Git >= v1.9.4
* Vagrant >= v1.6.3
* VirtualBox >= v4.3.12
* Packer >= v0.6.1


If you're in a hurry, skip to the relevant sub-section under Quickstarts below.


## Concerns

As of 2014-07-16, VirtualBox 4.3.14 is known to [fail](https://forums.virtualbox.org/viewtopic.php?f=6&t=62615) on Windows platforms. If you follow the Quickstart for Windows below, instead of using Chocolately `cinst virtualbox` , you will need to manually install VirtualBox using these steps:

* Download and install [VirtualBox 4.3.12](http://download.virtualbox.org/virtualbox/4.3.12/VirtualBox-4.3.12-93733-Win.exe)
* Download and install [VirtualBox Extensions](http://download.virtualbox.org/virtualbox/4.3.12/Oracle_VM_VirtualBox_Extension_Pack-4.3.12-93733.vbox-extpack)
* Download patch for [VirtualBox Guest Additions](https://www.virtualbox.org/download/testcase/VBoxGuestAdditions_4.3.13-94832.iso)
    * Rename this file to `VBoxGuestAdditions.iso`
    * Replace the copy of `VBoxGuestAdditions.iso` in `C:\Program Files\Oracle\VirtualBox` with the one you downloaded


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
    cinst vagrant
    cinst virtualbox

Verify your Windows `Path` by opening a `cmd.exe` shell and typing: 

    set | grep Path
    
the `bin` directories for `git`, `packer`, `vagrant`, and `virtualbox` should be included in your `Path`


## Verification

For each software package installed, open a shell and type 

* Git `git --version`
* Vagrant `vagrant -v`
* VirtualBox `VBoxManage`
* Packer `packer --version`


## Up Next

Ok, now that we have covered all the requirements, you can move on to [getting started with "CI in a Box"](GETTING_STARTED.md).
