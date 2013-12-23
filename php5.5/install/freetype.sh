#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
FREETYPE_SRC=freetype-2.4.12
tar zxvf $FREETYPE_SRC.tar.gz
cd $FREETYPE_SRC
make clean
./configure --prefix=$LIB_PATH --without-zlib
make
make install

cd ../
rm -rf $FREETYPE_SRC
