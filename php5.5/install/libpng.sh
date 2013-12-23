#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf libpng-1.5.17.tar.gz
cd libpng-1.5.17
make clean
./configure --prefix=$LIB_PATH --with-zlib-prefix=$LIB_PATH
make
make install

cd ../
#rm -rf libpng-1.5.17
