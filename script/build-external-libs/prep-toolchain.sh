#!/bin/sh

echo "preparing $EXTERNAL_LIBS_BUILD_ROOT"

build_root=$EXTERNAL_LIBS_BUILD_ROOT

rm -rf $build_root
mkdir -p $build_root

PATH=$ANDROID_NDK_ROOT/build/tools/:$PATH

echo "installing arm"
make_standalone_toolchain.py --api 21 --stl=libc++ --arch arm --install-dir $build_root/tool/arm

echo "installing arm64"
make_standalone_toolchain.py --api 21 --stl=libc++ --arch arm64 --install-dir $build_root/tool/arm64

echo "installing x86"
make_standalone_toolchain.py --api 21 --stl=libc++ --arch x86 --install-dir $build_root/tool/x86

echo "installing x86_64"
make_standalone_toolchain.py --api 21 --stl=libc++ --arch x86_64 --install-dir $build_root/tool/x86_64

echo "done"
