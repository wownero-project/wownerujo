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
"

archs=(arm arm64 x86_64)
for arch in ${archs[@]}; do
    extra_build_flags=""
    case ${arch} in
        "arm")
            target_host=arm-linux-androideabi
            extra_build_flags="--arch=armeabi-v7a"
            ;;
        "arm64")
            target_host=aarch64-linux-android
            ;;
        "x86_64")
            target_host=x86_64-linux-android
            ;;
        *)
            exit 16
            ;;
    esac

    echo "building for ${arch}"

    (PATH=$build_root/tool/$arch/$target_host/bin:$build_root/tool/$arch/bin:$PATH; \
         ./b2 \
         --build-dir=android-${arch} \
         --prefix=$build_root/build/boost/$arch \
         $args \
         $extr_build_flags \
         -j $NPROC \
         install)

    ln -sf ../include $build_root/build/boost/${arch}

done

exit 0
