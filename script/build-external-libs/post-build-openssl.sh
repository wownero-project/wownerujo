#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

build_root=$EXTERNAL_LIBS_BUILD_ROOT

mkdir -p $build_root/build/openssl/
cp -aL $build_root/android-openssl/openssl-OpenSSL_1_0_2l/include/openssl/ $build_root/build/openssl/include

archs=(arm arm64 x86_64)

for arch in ${archs[@]}; do
    mkdir -p $build_root/build/openssl/$arch

    cp -a $build_root/android-openssl/prebuilt/$arch $build_root/build/openssl/$arch/lib

    ln -s $build_root/build/openssl/include $build_root/build/openssl/$arch/include
    ln -sf $build_root/build/openssl/include $build_root/tool/$arch/sysroot/usr/include/openssl
    ln -sf $build_root/build/openssl/$arch/lib/*.so $build_root/tool/$arch/sysroot/usr/lib
done
