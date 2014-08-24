#!/bin/sh

. ./conf.sh

cd $SRC_ROOT_PATH
MCRYPT_SRC=libmcrypt-2.5.8
tar zxvf $MCRYPT_SRC.tar.gz
cd $MCRYPT_SRC
make clean
./configure --prefix=$LIB_PATH --disable-posix-threads
make
make install

cd ../
rm -rf $MCRYPT_SRC
