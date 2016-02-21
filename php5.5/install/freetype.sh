#!/bin/sh

. ./conf.sh

cd $SRC_ROOT_PATH
FREETYPE_SRC=freetype-2.6.3
tar zxvf $FREETYPE_SRC.tar.gz
cd $FREETYPE_SRC
make clean
./configure --prefix=$LIB_PATH --without-zlib --with-png=$LIB_PATH
make
make install

cd ../
rm -rf $FREETYPE_SRC
