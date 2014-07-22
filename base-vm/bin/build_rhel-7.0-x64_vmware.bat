set TEMPLATE=rhel-7.0-x64_vmware
cd ..\%TEMPLATE%

packer --version
packer inspect %TEMPLATE%.json
packer validate %TEMPLATE%.json
packer build %TEMPLATE%.json