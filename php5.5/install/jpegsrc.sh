#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar zxvf jpegsrc.v9.tar.gz
cd jpeg-9
make clean
./configure --prefix=$LIB_PATH 
make
make install

cd ../
rm -rf jpeg-9
