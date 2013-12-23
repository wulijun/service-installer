#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf zlib-1.2.8.tar.gz
cd zlib-1.2.8
make clean
./configure --prefix=$LIB_PATH
make
make install

cd ../
#rm -rf zlib-1.2.8
