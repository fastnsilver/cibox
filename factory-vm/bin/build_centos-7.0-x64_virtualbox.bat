set DIST=centos-7.0-x64
set TEMPLATE=%DIST%_virtualbox
cd ..\%DIST%

vagrant -v
vagrant box add --name ..\..\base-vm\%DIST%/%TEMPLATE%.box -f
vagrant up 
