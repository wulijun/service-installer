#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
LIBPNG_SRC=libpng-1.2.50
tar zxvf $LIBPNG_SRC.tar.gz
cd $LIBPNG_SRC
make clean
./configure --prefix=$LIB_PATH
make
make install

cd ../
rm -rf $LIBPNG_SRC
