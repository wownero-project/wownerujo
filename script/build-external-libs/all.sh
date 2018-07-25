#!/bin/sh

# make sure $ANDROID_NDK_ROOT is properly set
# for example: export $ANDROID_NDK_ROOT=~/Android/Sdk/ndk-bundle

DEFAULT_ANDROID_NDK_ROOT=~/Android/Sdk/ndk-bundle
ANDROID_NDK_ROOT="${ANDROID_NDK_ROOT:-${DEFAULT_ANDROID_NDK_ROOT}}"

export ANDROID_NDK_ROOT

DEFAULT_EXTERNAL_LIBS_BUILD=`pwd`/build/external-libs
EXTERNAL_LIBS_BUILD_PATH="${EXTERNAL_LIBS_BUILD_PATH:-${DEFAULT_EXTERNAL_LIBS_BUILD}}"

export EXTERNAL_LIBS_BUILD_PATH

echo "ANDROID_NDK_ROOT: " $ANDROID_NDK_ROOT
echo "EXTERNAL_LIBS_BUILD_PATH: " $EXTERNAL_LIBS_BUILD_PATH

# script/build-external-libs/prep-toolchain.sh
# script/build-external-libs/build-openssl.sh
# script/build-external-libs/post-build-openssl.sh
# script/build-external-libs/pre-build-boost.sh
# script/build-external-libs/build-boost.sh
# script/build-external-libs/build-wownero.sh
