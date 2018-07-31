#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

build_root=$EXTERNAL_LIBS_BUILD_ROOT

mkdir -p $build_root/build/openssl/{arm,arm64,x86,x86_64}

cp -a $build_root/android-openssl/prebuilt/armeabi   $build_root/build/openssl/arm/lib
cp -a $build_root/android-openssl/prebuilt/arm64-v8a $build_root/build/openssl/arm64/lib
cp -a $build_root/android-openssl/prebuilt/x86       $build_root/build/openssl/x86/lib
cp -a $build_root/android-openssl/prebuilt/x86_64    $build_root/build/openssl/x86_64/lib
cp -aL $build_root/android-openssl/openssl-OpenSSL_1_0_2l/include/openssl/ $build_root/build/openssl/include
ln -s $build_root/build/openssl/include $build_root/build/openssl/arm/include
ln -s $build_root/build/openssl/include $build_root/build/openssl/arm64/include
ln -s $build_root/build/openssl/include $build_root/build/openssl/x86/include
ln -s $build_root/build/openssl/include $build_root/build/openssl/x86_64/include


ln -sf $build_root/build/openssl/include $build_root/tool/arm/sysroot/usr/include/openssl
ln -sf $build_root/build/openssl/arm/lib/*.so $build_root/tool/arm/sysroot/usr/lib

ln -sf $build_root/build/openssl/include $build_root/tool/arm64/sysroot/usr/include/openssl
ln -sf $build_root/build/openssl/arm64/lib/*.so $build_root/tool/arm64/sysroot/usr/lib

ln -sf $build_root/build/openssl/include $build_root/tool/x86/sysroot/usr/include/openssl
ln -sf $build_root/build/openssl/x86/lib/*.so $build_root/tool/x86/sysroot/usr/lib

ln -sf $build_root/build/openssl/include $build_root/tool/x86_64/sysroot/usr/include/openssl
ln -sf $build_root/build/openssl/x86_64/lib/*.so $build_root/tool/x86_64/sysroot/usr/lib64
