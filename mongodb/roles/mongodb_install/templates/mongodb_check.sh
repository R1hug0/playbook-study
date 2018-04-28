#!/bin/bash
if [ ! -d '/usr/local/mongodb/bin' ]; then
echo "********check setup directroy********" > /tmp/mongodb.status
echo "mongodb setup failed!!" >> /tmp/mongodb.status
exit
fi
if [ ! -e '/etc/init.d/mongod' ]; then
echo "********start script********" >> /tmp/mongodb.status
echo "mongodb start script no exist!!" >> /tmp/mongodb.status
fi
s=`ps aux |grep mongod | grep -v "grep" | wc -l`
if [ $s -lt 1 ];then 
echo "********status********" >> /tmp/mongodb.status
echo "mongodb is not running!!" >> /tmp/mongodb.status
echo "try start mongodb program" >> /tmp/mongodb.status
/etc/init.d/mongod start
fi
rm -f /tmp/$(basename $0)
