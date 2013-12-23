#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
LIBGD_SRC=libgd-2.1.0
tar -zxvf $LIBGD_SRC.tar.gz
cmake . -DENABLE_JPEG=On -DENABLE_FREETYPE=On -DENABLE_PNG=On -DCMAKE_INCLUDE_PATH=$LIB_PATH/include -DCMAKE_LIBRARY_PATH=$LIB_PATH/lib -DCMAKE_INSTALL_PREFIX=$LIB_PATH
make
make install

cd ../
rm -rf $LIBGD_SRC
