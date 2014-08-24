#!/bin/sh

. ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf libdatrie-0.2.4.tar.gz
cd libdatrie-0.2.4
make clean
./configure --prefix=$LIB_PATH
make
make install

cd ../
rm -rf libdatrie-0.2.4
