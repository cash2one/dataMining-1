#!/usr/bin/env 

sudo apt-get update
sudo apt-get -y install build-essential
sudo apt-get -y install libmysqlclient-dev
sudo apt-get -y install libevent-dev
sudo apt-get -y install python-dev
sudo apt-get -y install python-pip
sudo apt-get -y install libxslt1-dev
sudo apt-get -y install libxml2-dev
sudo apt-get -y install subversion
sudo apt-get -y install git
sudo apt-get -y install mysql-client
sudo apt-get -y install mysql-server

sudo pip install tornado
sudo pip install requests
sudo pip install BeautifulSoup
sudo pip install redis
sudo pip install lxml
sudo pip install pyquery

sudo apt-get -y install build-essential
sudo apt-get -y install libxslt1-dev
sudo apt-get -y install libxml2-dev
sudo dd if=/dev/zero of=/swapfile bs=1024 count=524288
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo pip install Cython
sudo pip install lxml
sudo pip install pyquery
sudo swapoff /swapfile

cd /
sudo mkdir data
cd /data/
svn co svn://223.4.155.172/script --username gsavl --password gsavl --trust-server-cert --non-interactive
cd /data/script/
sh update.sh

# install git on CentOS
yum install -y curl
yum install -y curl-devel
yum install -y zlib-devel
yum install -y openssl-devel
yum install -y perl
yum install -y cpio
yum install -y expat-devel
yum install -y gettext-devel
wget https://github.com/git/git/archive/master.zip
unzip master
cd git-master/
autoconf
./configure
make
sudo make install
cd ../
sudo rm -rf git-master
sudo rm -f master
git --version

# install all libraries
git clone git://github.com/lannikcooper/Third-Party-Libs.git
cd Third-Party-Libs/
cd pyyaml/
sudo python2.7 setup.py install
cd ../dateutil/
sudo python2.7 setup.py install
cd ../MySQLdb/
sudo python2.7 setup.py install
cd ../../
rm -rf Third-Party-Libs

# install only pyyaml
git clone git://github.com/lannikcooper/Third-Party-Libs.git/pyyaml
cd pyyaml/
sudo python2.7 setup.py install
cd ../
sudo rm -rf pyyaml
