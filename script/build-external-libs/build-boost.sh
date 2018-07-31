#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

build_root=$EXTERNAL_LIBS_BUILD_ROOT
cd $build_root/boost_1_58_0

# ./bootstrap.sh --with-toolset=clang
./bootstrap.sh

args="--build-type=minimal link=static runtime-link=static --with-chrono \
--with-date_time --with-filesystem --with-program_options --with-regex \
--with-serialization --with-system --with-thread \
--includedir=$build_root/build/boost/include \
--toolset=clang threading=multi threadapi=pthread target-os=android \
install"

echo $args

PATH=$build_root/tool/arm/arm-linux-androideabi/bin:$build_root/tool/arm/bin:$PATH \
    ./b2 --build-dir=android-arm --prefix=$build_root/build/boost/arm $args
ln -sf ../include $build_root/build/boost/arm

PATH=$build_root/tool/arm64/aarch64-linux-androideabi/bin:$build_root/tool/arm64/bin:$PATH \
    ./b2 --build-dir=android-arm64 --prefix=$build_root/build/boost/arm64 $args
ln -sf ../include $build_root/build/boost/arm64

PATH=$build_root/tool/x86/i686-linux-android/bin:$build_root/tool/x86/bin:$PATH \
    ./b2 --build-dir=android-x86--prefix=$build_root/build/boost/x86 $args
ln -sf ../include $build_root/build/boost/x86

PATH=$build_root/tool/x86_64/x86_64-linux-android/bin:$build_root/tool/x86_64/bin:$PATH \
    ./b2 --build-dir=android-x86_64 --prefix=$build_root/build/boost/x86_64 $args
ln -sf ../include $build_root/build/boost/x86_64
