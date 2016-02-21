#!/bin/sh

. ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf jpegsrc.v9b.tar.gz
cd jpeg-9b
make clean
./configure --prefix=$LIB_PATH 
make
make install

cd ../
rm -rf jpeg-9b
