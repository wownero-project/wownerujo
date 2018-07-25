#!/bin/sh

cd $EXTERNAL_LIBS_BUILD_ROOT

git clone https://github.com/m2049r/android-openssl.git
wget https://github.com/openssl/openssl/archive/OpenSSL_1_0_2l.tar.gz
cd android-openssl
tar xfz ../OpenSSL_1_0_2l.tar.gz
./build-all-arch.sh
