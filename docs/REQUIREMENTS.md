# Requirements

"CI in a Box" has a few requirements that must be met before you're able to use it. The following software should be installed and configured:

* Git >= v1.9.4
* Ruby >= v1.9.3
* Ruby devkit >= v1.9.3
* Vagrant >= v1.6.3
* VirtualBox >= v4.3.12
* Veewee >= v0.3.12
* Packer >= v0.6.0


If you're in a hurry, skip to the relevant sub-section under OS Quickstarts below.


## OS Quickstarts

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
    cinst ruby
    cinst ruby2.devkit
    cinst vagrant
    cinst virtualbox
    cinst packer

Continue installing Ruby gems:

    gem install bundler
    gem install veewee
    gem install veewee-to-packer

Make sure that the following is in your `PATH`

    // TODO validate where Chocolately installs above, then add VirtualBox, Vagrant, Ruby and Git bin directories


## Up Next

Ok, now that we have covered all the requirements, you can move on to [getting started with "CI in a Box"](GETTING_STARTED.md).
