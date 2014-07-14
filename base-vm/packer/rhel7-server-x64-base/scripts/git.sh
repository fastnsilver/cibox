VEEWEE_HOME=/home/veewee
VERSION=2.0.1
yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker
wget https://www.kernel.org/pub/software/scm/git/git-$VERSION.tar.gz
chown veewee:veewee $VEEWEE_HOME/git-$VERSION.tar.gz
tar xzf git-$VERSION.tar.gz
chown veewee:veewee -R $VEEWEE_HOME/git-$VERSION
cd git-$VERSION
make prefix=/usr/local/git all
make prefix=/usr/local/git install
echo "export PATH=/usr/local/git/bin:$PATH" >> /etc/bashrc
source /etc/bashrc
