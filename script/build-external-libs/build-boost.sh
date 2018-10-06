#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

build_root=$EXTERNAL_LIBS_BUILD_ROOT

version=1_67_0

cd $build_root/boost_${version}

# ./bootstrap.sh --with-toolset=clang
./bootstrap.sh

args="--build-type=minimal link=static runtime-link=static --with-chrono \
--with-date_time --with-filesystem --with-program_options --with-regex \
--with-serialization --with-system --with-thread \
--includedir=$build_root/build/boost/include \
--toolset=clang-android threading=multi threadapi=pthread target-os=android \
-j $NPROC \
"

echo $args

PATH=$build_root/tool/arm/arm-linux-androideabi/bin:$build_root/tool/arm/bin:$PATH \
    ./b2 --build-dir=android-arm --prefix=$build_root/build/boost/arm $args \
    --arch=armeabi-v7a \
    install
ln -sf ../include $build_root/build/boost/arm

PATH=$build_root/tool/arm64/aarch64-linux-androideabi/bin:$build_root/tool/arm64/bin:$PATH \
    ./b2 --build-dir=android-arm64 --prefix=$build_root/build/boost/arm64 $args \
    install
ln -sf ../include $build_root/build/boost/arm64

PATH=$build_root/tool/x86_64/x86_64-linux-android/bin:$build_root/tool/x86_64/bin:$PATH \
    ./b2 --build-dir=android-x86_64 --prefix=$build_root/build/boost/x86_64 $args \
    install
ln -sf ../include $build_root/build/boost/x86_64
