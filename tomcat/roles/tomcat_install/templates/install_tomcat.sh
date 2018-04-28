#!/bin/bash
###init tomcat db###"
tar zxf /tmp/{{ tomcat_version }}.tar.gz  -C /usr/local/
mv  /usr/local/{{ tomcat_version }}  /usr/local/tomcat 
mv /tmp/setenv.sh  {{ tomcat_basedir }}bin/
cd {{ tomcat_confdir }}
mv server.xml server.xml.default
mv /tmp/jsvc {{ tomcat_basedir }}bin/
mv /tmp/server.xml  {{tomcat_confdir}}
chown {{ tomcat_user }}:{{ tomcat_user }}    {{ tomcat_basedir }} -R
sleep 5
rm -f /tmp/$(basename $0)
