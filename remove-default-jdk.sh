#!/bin/bash -

# Remove all the Java related packages \
#  (Sun, Oracle, OpenJDK, IcedTea plugins, GIJ)
dpkg-query -W -f='${binary:Package}\n' | \
  grep -E -e '^(ia32-)?(sun|oracle)-java' \
  -e '^openjdk-' -e '^icedtea' -e '^(default|gcj)-j(re|dk)' \
  -e '^gcj-(.*)-j(re|dk)' \
  -e '^java-common' | xargs apt-get -y remove

apt-get -y autoremove

# Purge config files
dpkg -l | grep ^rc | awk '{print($2)}' | xargs apt-get -y purge

#Remove Java config and cache directory:
#bash -c 'ls -d /home/*/.java' | xargs rm -rf

# Remove manually installed JVMs:
rm -rf /usr/lib/jvm/*

# Remove Java entries, if there is still any, from the alternatives:
#for g in ControlPanel java java_vm javaws jcontrol jexec keytool \
# mozilla-javaplugin.so orbd pack200 policytool rmid rmiregistry \
# servertool tnameserv unpack200 appletviewer apt extcheck HtmlConverter \
# idlj jar jarsigner javac javadoc javah javap jconsole jdb jhat jinfo \
# jmap jps jrunscript jsadebugd jstack jstat jstatd native2ascii rmic \
# schemagen serialver wsgen wsimport xjc xulrunner-1.9-javaplugin.so; 
#do update-alternatives --remove-all $g; done

# Search for possible remaining Java directories:
#updatedb
#locate -b '\pack200'
