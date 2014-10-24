#!/bin/sh

. ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf libxml2-2.9.2.tar.gz
cd libxml2-2.9.2
make clean
./configure --prefix=$LIB_PATH
make
make install

cd ../
rm -rf libxml2-2.9.2
