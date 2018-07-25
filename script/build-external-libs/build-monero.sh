#!/bin/sh

cd /opt/android
git clone --recursive -b release-v0.12.1-monerujo-v1.5.4 https://github.com/m2049r/monero.git


cd monero

sed -i 's/-Werror/-Wall/g' CMakeLists.txt
sed -i \
    's@OPENSSL_ROOT_DIR=/opt/android/build/openssl/$arch -D@OPENSSL_ROOT_DIR=/opt/android/build/openssl/$arch -D OPENSSL_INCLUDE_DIR=/opt/android/build/openssl/$arch/include -D@g' \
    build-all-arch.sh

./build-all-arch.sh
