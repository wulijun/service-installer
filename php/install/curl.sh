#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf curl-7.21.6.tar.gz
cd curl-7.21.6
make clean
./configure --prefix=$LIB_PATH --enable-http \
	--enable-ftp --enable-file --enable-ldap --enable-dict --enable-telnet \
	--enable-tftp --enable-manual --enable-libgcc \
	--enable-nonblocking --enable-thread --enable-verbose --enable-cookies
make
make install

cd ../
#rm -rf curl-7.21.6
