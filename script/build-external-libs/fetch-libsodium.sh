#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

cd $EXTERNAL_LIBS_BUILD_ROOT

version=1.0.16
# version=c4f03e

rm -rf libsodium
git clone https://github.com/jedisct1/libsodium.git

cd libsodium
git checkout ${version}

