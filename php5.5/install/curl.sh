#!/bin/sh

. ./conf.sh

cd $SRC_ROOT_PATH
CURL_SRC=curl-7.37.1
tar zxvf $CURL_SRC.tar.gz
cd $CURL_SRC
make clean
./configure --prefix=$LIB_PATH --disable-gopher --disable-rtsp --enable-ipv6 --with-zlib=$LIB_PATH \
	 --enable-cookies
make
make install

cd ../
rm -rf $CURL_SRC
