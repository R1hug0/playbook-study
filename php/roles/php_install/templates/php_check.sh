#!/bin/bash
if [ ! -d '/usr/local/php/bin' ]; then
echo "********check setup directroy********" > /tmp/php.status
echo "php setup failed!!" >> /tmp/php.status
exit
fi
if [ ! -e '/etc/init.d/php-fpm' ]; then
echo "********start script********" >> /tmp/php.status
echo "php start script no exist!!" >> /tmp/php.status
fi
s=`ps aux |grep php | grep -v "grep" | wc -l`
if [ $s -lt 1 ];then 
echo "********status********" >> /tmp/php.status
echo "php is not running!!" >> /tmp/php.status
echo "try start php program" >> /tmp/php.status
/etc/init.d/php-fpm  start
fi
rm -f /tmp/$(basename $0)
