#!/bin/bash
#check mysql php nginx
mysql_num=$(ps aux |grep mysqld |grep basedir |grep -v grep |wc -l)
php_num=$(ps aux |grep php-fpm|grep master|grep -v grep |wc -l)
nginx_num=$(ps aux |grep nginx|grep master|grep -v grep |wc -l)
if [ $mysql_num  -eq 0 -o $php_num -eq 0 -o ! -d "/usr/local/nginx" ];then
 echo "env check failed!!"
else
echo "env check success"
fi
