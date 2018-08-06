#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

cd $EXTERNAL_LIBS_BUILD_ROOT

version="93e9e6"

rm -rf android-openssl
wget https://github.com/openssl/openssl/archive/OpenSSL_1_0_2l.tar.gz

mkdir android-openssl
cd android-openssl

tar xfz ../OpenSSL_1_0_2l.tar.gz
