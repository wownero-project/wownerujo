#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

build_root=$EXTERNAL_LIBS_BUILD_ROOT

PATH=$ANDROID_NDK_ROOT/build/tools/:$PATH

if [ ! -d "$build_root/tool/arm" ]; then
    echo "installing arm"
    make_standalone_toolchain.py --api 21 --stl=libc++ --arch arm --install-dir $build_root/tool/arm
fi

if [ ! -d "$build_root/tool/arm64" ]; then
    echo "installing arm64"
    make_standalone_toolchain.py --api 21 --stl=libc++ --arch arm64 --install-dir $build_root/tool/arm64
fi

if [ ! -d "$build_root/tool/x86" ]; then
    echo "installing x86"
    make_standalone_toolchain.py --api 21 --stl=libc++ --arch x86 --install-dir $build_root/tool/x86
fi

if [ ! -d "$build_root/tool/x86_64" ]; then
    echo "installing x86_64"
    make_standalone_toolchain.py --api 21 --stl=libc++ --arch x86_64 --install-dir $build_root/tool/x86_64
fi
