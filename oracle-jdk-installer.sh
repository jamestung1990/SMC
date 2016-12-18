#!/bin/bash -

url=http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz

fileName=`basename $url`

if [ ! -f $fileName ]
then
  wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $url
fi

workDir=`basename -s .tar.gz $fileName`
if [ ! -d /opt/jdk/$workDor ]
then
  mkdir /opt/jdk/
  tar -zxv $fileName -C /opt/jdk
fi

update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_112/bin/java 100
update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_112/bin/javac 100

java -version
javac -version
