#!/bin/bash
ntpdate time.apple.com
#update gcc to 4.8.2
/bin/sh /tmp/updategccto4.8.sh
#make php 
cd  {{ php_makedir }}{{ php_version }}
./configure    --prefix=/usr/local/php \
    --with-config-file-path=/usr/local/php/etc --enable-fpm    \
    --with-fpm-user=www --with-fpm-group=www --with-mysqli \
    --with-pdo-mysql --with-iconv-dir --with-freetype-dir \
    --with-jpeg-dir --with-png-dir --with-zlib  \
    --enable-xml --disable-rpath --enable-bcmath --enable-shmop \
    --enable-sysvsem --enable-inline-optimization --with-curl \
    --enable-mbregex --enable-mbstring --with-mcrypt --enable-ftp \
    --with-gd --enable-gd-native-ttf --with-openssl --with-mhash \
    --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip \
    --enable-soap --without-pear --with-gettext --disable-fileinfo \
    --enable-maintainer-zts --enable-opcache --with-apxs2={{ apxs_dir }} --with-ldap
make -j4 
make install
###init php db###"
cd  {{ php_makedir }}{{ php_version }}
cp /tmp/php.ini {{ php_confdir }}php.ini
cp /tmp/www.conf {{ php_confdir }}php-fpm.d/
cp /tmp/php-fpm.conf {{ php_confdir }}php-fpm.conf
chown {{ php_user }}:{{ php_user }}    {{ php_basedir }} -R
cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
chomod +x /etc/init.d/php-fpm
/etc/init.d/php-fpm start 
sleep 5
echo "PHP_HOME=/usr/local/php" >> /etc/profile
echo "export PHP_HOME"   >> /etc/profile
echo 'export PATH=${PATH}:${PHP_HOME}/bin' >> /etc/profile
source /etc/profile
chown {{ php_user }}:{{ php_user }}  {{ php_basedir }} -R
rm -f /tmp/$(basename $0)
