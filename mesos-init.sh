#!/bin/bash -

# Update the packages.
apt-get update

# Install a few utility tools.
apt-get install -y tar wget git

# Install the latest OpenJDK.
#apt-get install -y openjdk-8-jdk
./oracle-jdk-installer.sh

# Install autotools (Only necessary if building from git repository).
apt-get install -y autoconf libtool

# Install other Mesos dependencies.
apt-get -y install build-essential python-dev libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev

pwdDir=$(pwd)
dirName=`dirname $0`
url="http://www.apache.org/dist/mesos/1.1.0/mesos-1.1.0.tar.gz"
fileName=`basename $url`

./downloader.sh $url

cd $dirName
tar -zxf $fileName
workDir=`basename -s .tar.gz $fileName`
chown -R `whoami`:`whoami` $workDir
cd $workDir
rm -rf build
mkdir build
cd build
../configure --prefix=/opt/mesos-1.1.0
make -j 2
make -j 2 check
make install

cd $pwdDir
