#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

project_root=`pwd`

cd $EXTERNAL_LIBS_BUILD_ROOT
mkdir -p build-openssl-android
cd build-openssl-android

$project_root/script/build-external-libs/build-openssl-android.sh 23 23
