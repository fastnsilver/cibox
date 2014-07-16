cd ..

@start /b /w cmd /c veewee vbox build 'centos7-server-x64-base' --force --no-gui

REM @start /b /w cmd /c veewee vbox validate 'centos7-server-x64-base' 

@start /b /w cmd /c veewee vbox export 'centos7-server-x64-base'

@start /b /w cmd /c vagrant box add centos7-server-x64-base centos7-server-x64-base.box --force

@start /b /w cmd /c VBoxManage export centos7-server-x64-base --output centos7-server-x64-base.ovf
