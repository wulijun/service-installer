#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf libxml2-2.7.8.tar.gz
cd libxml2-2.7.8
make clean
./configure --prefix=$LIB_PATH
make
make install

cd ../
#rm -rf libxml2-2.7.8
