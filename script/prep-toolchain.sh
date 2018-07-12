#!/bin/sh

echo "preparing /opt/android"
mkdir -p /opt/android/build

echo "installing arm"
make_standalone_toolchain.py --api 21 --stl=libc++ --arch arm --install-dir /opt/android/tool/arm

echo "installing arm64"
make_standalone_toolchain.py --api 21 --stl=libc++ --arch arm64 --install-dir /opt/android/tool/arm64

echo "installing x86"
make_standalone_toolchain.py --api 21 --stl=libc++ --arch x86 --install-dir /opt/android/tool/x86

echo "installing x86_64"
make_standalone_toolchain.py --api 21 --stl=libc++ --arch x86_64 --install-dir /opt/android/tool/x86_64

echo "done"
