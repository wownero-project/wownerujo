#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

build_root=$EXTERNAL_LIBS_BUILD_ROOT
PATH=$ANDROID_NDK_ROOT/build/tools/:$PATH

args="--api 23 --stl=libc++"
archs=(arm64 x86_64)

for arch in ${archs[@]}; do

    if [ ! -d "$build_root/tool/$arch" ]; then
        echo "installing $arch"
        make_standalone_toolchain.py $args --arch $arch --install-dir $build_root/tool/$arch
    fi

done
