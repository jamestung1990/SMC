#!/bin/bash -

url=http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jdk-8u112-linux-x64.tar.gz

fileName=`basename $url`

if [ ! -f $fileName ]
then
  wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $url
fi

workDir=`tar -tzf $fileName | head -1 | cut -f1 -d"/"`
if [ ! -d /opt/jdk/$workDir ]
then
  mkdir -p /opt/jdk/
  tar -zxvf $fileName -C /opt/jdk
fi

./remove-default-jdk.sh

update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_112/bin/java 100
update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_112/bin/javac 100

java -version
javac -version

export JAVA_HOME=/opt/jdk/$workDir
