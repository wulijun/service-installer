#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf jpegsrc.v8c.tar.gz
cd jpeg-8c
make clean
./configure --prefix=$LIB_PATH 
make
make install

cd ../
#rm -rf jpeg-8c
