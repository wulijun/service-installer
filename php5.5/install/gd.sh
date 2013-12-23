#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
LIBGD_SRC=gd-2.0.33
tar -zxvf $LIBGD_SRC.tar.gz
cd $LIBGD_SRC
./configure --prefix=$LIB_PATH --with-freetype=$LIB_PATH --with-jpeg=$LIB_PATH --with-png=$LIB_PATH
make
make install

cd ../
rm -rf $LIBGD_SRC
