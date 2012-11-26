#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf freetype-2.4.4.tar.gz
cd freetype-2.4.4
make clean
./configure --prefix=$LIB_PATH --without-zlib
make
make install

cd ../
#rm -rf freetype-2.4.4
