#!/usr/bin/env bash

set -e

# make sure $ANDROID_NDK_ROOT is properly set
# for example: export $ANDROID_NDK_ROOT=~/Android/Sdk/ndk-bundle

source script/build-external-libs/env.sh

echo "ANDROID_NDK_ROOT: " $ANDROID_NDK_ROOT
echo "EXTERNAL_LIBS_BUILD_ROOT: " $EXTERNAL_LIBS_BUILD_ROOT

script/build-external-libs/pre-build.sh
script/build-external-libs/build.sh

