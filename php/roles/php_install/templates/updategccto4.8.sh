#!/bin/bash
cd /usr/local/src
#wget http://gcc.skazkaforyou.com/releases/gcc-4.8.2/gcc-4.8.2.tar.gz
cd gcc-4.8.2
./contrib/download_prerequisites
mkdir gcc-build-4.8.2
cd gcc-build-4.8.2
../configure --enable-checking=release --enable-languages=c,c++ --disable-multilib
#--enable-languages表示你要让你的gcc支持那些语言
#--disable-multilib不生成编译为其他平台可执行代码的交叉编译器
#--disable-checking生成的编译器在编译过程中不做额外检查，也可以使用--enable-checking=xxx来增加一些检查
make
make  install
gcc -v
g++ -v
which gcc
/usr/local/bin/gcc -v
