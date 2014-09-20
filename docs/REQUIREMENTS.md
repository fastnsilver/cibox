# Requirements

"CI in a Box" has a few requirements that must be met before you're able to use it. The following software should be installed and configured:

* Git >= v1.9.4
* Vagrant >= v1.6.5
* VirtualBox >= v4.3.16
* Packer >= v0.7.1


If you're in a hurry, skip to the relevant sub-section under Quickstarts below.


## Quickstarts

Attention is focused on three operating system variants: Linux, Mac OS X, and Windows. 


### Linux

    // TODO


### Mac OS X
    
On Macs, install [Xcode](https://developer.apple.com/xcode/downloads/), then install [Homebrew](http://mxcl.github.io/homebrew/).

Open a `Terminal` shell as Administrator, and type:

    brew install git
    brew install packer
    brew tap caskroom/cask
    brew tap homebrew/binary
    brew tap homebrew/versions
    brew cask install virtualbox
    brew cask install vagrant


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
