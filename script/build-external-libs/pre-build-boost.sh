#!/bin/sh

cd $EXTERNAL_LIBS_BUILD_ROOT
wget https://sourceforge.net/projects/boost/files/boost/1.58.0/boost_1_58_0.tar.gz/download -O boost_1_58_0.tar.gz
tar xfz boost_1_58_0.tar.gz
cd boost_1_58_0
./bootstrap.sh
