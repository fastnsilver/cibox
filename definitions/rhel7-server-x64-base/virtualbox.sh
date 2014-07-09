# Installing the virtualbox guest additions
VBOX_VERSION=$(cat /home/veewee/.vbox_version)
#cd /tmp
#mount -o loop /home/veewee/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt

#sh /mnt/VBoxLinuxAdditions.run
#umount /mnt
#rm -rf /home/veewee/VBoxGuestAdditions_*.iso

# See https://access.redhat.com/discussions/645973
# As of 2014-07-09, VirtualBox 4.3.12 is known to fail on installing Guest Additions in RHEL 7
# This procedure will patch the .run file per http://matthewcasperson.blogspot.com/2014/06/rhel-7-virtualbox-guest-additions.html
wget https://dl.dropboxusercontent.com/u/1526979/VirtualBoxGuestAditions-4.3.12-RHEL7.tar.bz2
chown veewee:veewee VirtualBoxGuestAditions-4.3.12-RHEL7.tar.bz2
tar xvjf VirtualBoxGuestAditions-4.3.12-RHEL7.tar.bz2
./vbox-extract/install.sh
rm -Rf vbox-extract
rm -f VirtualBoxGuestAditions-4.3.12-RHEL7.tar.bz2