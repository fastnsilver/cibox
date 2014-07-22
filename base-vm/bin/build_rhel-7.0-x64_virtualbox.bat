set DIST=rhel-7.0-x64
set TEMPLATE=%DIST%_virtualbox
cd ..\%DIST%

packer --version
packer inspect %TEMPLATE%.json
packer validate %TEMPLATE%.json
packer build %TEMPLATE%.json
