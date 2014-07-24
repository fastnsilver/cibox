@echo off
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~0,4%%ldt:~4,2%%ldt:~6,2%%ldt:~8,2%%ldt:~10,2%%ldt:~12,6%

set DIST=centos-7.0-x64
set TEMPLATE=%DIST%_vmware
cd ..\..\%DIST%

@echo on
vagrant -v
vagrant box add -f --name=%TEMPLATE% --provider=vmware_desktop ..\..\base-vm\%DIST%\%TEMPLATE%.box
vagrant up --provider=vmware_workstation
