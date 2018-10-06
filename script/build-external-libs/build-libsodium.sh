#!/bin/bash

set -e

source script/build-external-libs/env.sh

build_root=$EXTERNAL_LIBS_BUILD_ROOT
cd $build_root/libsodium
./autogen.sh

archs=(arm arm64 x86_64)
for arch in ${archs[@]}; do
    extra_cmake_flags=""
    case ${arch} in
        "arm")
            target_host=arm-linux-androideabi
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

    OUTPUT_DIR=$build_root/build/libsodium/$arch

    mkdir -p $OUTPUT_DIR
    echo "building for ${arch}"

    (PATH=$build_root/tool/$arch/$target_host/bin:$build_root/tool/$arch/bin:$PATH \
        CC=clang CXX=clang++; \
        ./configure \
        --prefix=${OUTPUT_DIR} \
        --host=${target_host} \
        --enable-static \
        --disable-shared \
            && make -j $NPROC && make install && make clean)


done

exit 0
