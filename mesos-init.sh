#!/bin/bash -

./init.sh

# Install Mesos dependencies.
apt-get -y install build-essential python-dev libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev 

# Install the latest OpenJDK.
#apt-get install -y openjdk-8-jdk
./oracle-jdk-installer.sh

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
