cd ..

@start /b /w cmd /c veewee vbox build 'rhel7-server-x64-base' --force --no-gui

REM @start /b /w cmd /c veewee vbox validate 'rhel7-server-x64-base' 

@start /b /w cmd /c veewee vbox export 'rhel7-server-x64-base' 

@start /b /w cmd /c vagrant box add rhel7-server-x64-base rhel7-server-x64-base.box --force

@start /b /w cmd /c VBoxManage export rhel7-server-x64-base --output rhel7-server-x64-base.ovf
