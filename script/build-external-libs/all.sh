#!/bin/sh

# make sure $ANDROID_NDK_ROOT is properly set
# for example: export $ANDROID_NDK_ROOT=~/Android/Sdk/ndk-bundle

source script/build-external-libs/env.sh

echo "ANDROID_NDK_ROOT: " $ANDROID_NDK_ROOT
echo "EXTERNAL_LIBS_BUILD_ROOT: " $EXTERNAL_LIBS_BUILD_ROOT


script/build-external-libs/prep-toolchain.sh


script/build-external-libs/build-openssl.sh
script/build-external-libs/post-build-openssl.sh


script/build-external-libs/pre-build-boost.sh
script/build-external-libs/build-boost.sh


script/build-external-libs/build-wownero.sh


script/build-external-libs/collect.sh



