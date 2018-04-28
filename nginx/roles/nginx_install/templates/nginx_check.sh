#!/bin/bash
if [ ! -d '/usr/local/nginx/sbin' ]; then
echo "********check setup directroy********" > /tmp/nginx.status
echo "nginx setup failed!!" >> /tmp/nginx.status
exit
fi
if [ ! -e '/etc/init.d/nginx' ]; then
echo "********start script********" >> /tmp/nginx.status
echo "nginx start script no exist!!" >> /tmp/nginx.status
fi
s=`ps aux |grep nginx | grep -v "grep" | wc -l`
if [ $s -lt 1 ];then 
echo "********status********" >> /tmp/nginx.status
echo "nginx is not running!!" >> /tmp/nginx.status
echo "try start nginx program" >> /tmp/nginx.status
fi
