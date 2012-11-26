#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf gd-2.0.33.tar.gz
cd gd-2.0.33
make clean
./configure --prefix=$LIB_PATH --with-freetype=$LIB_PATH --with-jpeg=$LIB_PATH --with-png=$LIB_PATH
make
make install

cd ../
#rm -rf gd-2.0.33
