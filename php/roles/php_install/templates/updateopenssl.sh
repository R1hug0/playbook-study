#!/bin/bash
cd /usr/local/src
mv /usr/bin/openssl  /usr/bin/openssl1.01e
#wget https://www.openssl.org/source/openssl-1.0.1s.tar.gz -O openssl-1.0.1s.tar.gz
#wget http://www.openssl.org/source/openssl-1.0.2g.tar.gz  -O openssl-1.0.2g.tar.gz
cd /usr/local/src
tar -zxf /tmp/{{ openssl_version }}.tar.gz -C /usr/local/src/
cd {{ openssl_version }}
./config
a=$?
if [ $a -eq 0 ]; then
echo "                "
echo "make failed"
exit
fi
make
make depend
make test
make install
openssl version 
#mv /usr/bin/openssl  /usr/bin/openssl1.01e
#ln -s /usr/local/ssl/bin/openssl /usr/bin/openssl
#openssl version
