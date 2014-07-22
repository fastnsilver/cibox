# Install Oracle JDK 7

# Become root
sudo -i

# Installs 1.7.0_xx version
# from http://lalyos.github.io/blog/2014/03/18/oracle-jdk-7-on-centos/
curl -LO 'http://download.oracle.com/otn-pub/java/jdk/7u60-b19/jdk-7u60-linux-x64.rpm' \
-H 'Cookie: oraclelicense=accept-securebackup-cookie'
yum --nogpgcheck -y localinstall jdk-7u60-linux-x64.rpm