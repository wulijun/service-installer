#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf libmcrypt-2.5.8.tar.gz
cd libmcrypt-2.5.8
make clean
./configure --prefix=$LIB_PATH --disable-posix-threads
make
make install

cd ../
#rm -rf libmcrypt-2.5.8
