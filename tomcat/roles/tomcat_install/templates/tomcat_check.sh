#!/bin/bash
if [ ! -d '/usr/local/tomcat/bin' ]; then
echo "********check setup directroy********" > /tmp/tomcat.status
echo "tomcat setup failed!!" >> /tmp/tomcat.status
exit
fi
if [ ! -e '/etc/init.d/tomcat' ]; then
echo "********start script********" >> /tmp/tomcat.status
echo "tomcat start script no exist!!" >> /tmp/tomcat.status
fi
s=`ps aux |grep tomcat | grep -v "grep" | wc -l`
if [ $s -lt 1 ];then 
echo "********status********" >> /tmp/tomcat.status
echo "tomcat is not running!!" >> /tmp/tomcat.status
echo "try start tomcat program" >> /tmp/tomcat.status
#/etc/init.d/tomcat start
fi
rm -f /tmp/$(basename $0)
