set DIST=centos-7.0-x64
set TEMPLATE=%DIST%_vmware
cd ..\%DIST%

packer --version
packer inspect %TEMPLATE%.json
packer validate %TEMPLATE%.json
packer build %TEMPLATE%.json
