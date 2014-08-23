#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf libxml2-2.9.1.tar.gz
cd libxml2-2.9.1
make clean
./configure --prefix=$LIB_PATH
make
make install

cd ../
rm -rf libxml2-2.9.1
