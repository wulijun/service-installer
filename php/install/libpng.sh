#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf libpng-1.2.46.tar.gz
cd libpng-1.2.46
make clean
./configure --prefix=$LIB_PATH
make
make install

cd ../
#rm -rf libpng-1.2.46
