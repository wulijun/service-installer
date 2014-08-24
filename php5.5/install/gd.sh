#!/bin/sh

. ./conf.sh

cd $SRC_ROOT_PATH
LIBGD_SRC=libgd-2.1.0
tar -zxvf $LIBGD_SRC.tar.gz
cd $LIBGD_SRC
./configure --prefix=$LIB_PATH --with-freetype=$LIB_PATH --with-jpeg=$LIB_PATH --with-png=$LIB_PATH
make
make install

cd ../
rm -rf $LIBGD_SRC
