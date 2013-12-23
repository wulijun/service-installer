#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
PCRE_SRC=pcre-8.34
tar zxvf $PCRE_SRC.tar.gz
cd $PCRE_SRC
make clean
./configure --prefix=$LIB_PATH --enable-jit --enable-utf
make
make install

cd ../
rm -rf $PCRE_SRC