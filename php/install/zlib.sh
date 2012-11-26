#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf zlib-1.2.5.tar.gz
cd zlib-1.2.5
make clean
./configure --prefix=$LIB_PATH
make
make install

cd ../
#rm -rf zlib-1.2.5
