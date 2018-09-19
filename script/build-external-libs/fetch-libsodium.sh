#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

cd $EXTERNAL_LIBS_BUILD_ROOT

version=1.0.16
hash=675149b9b8b66ff44152553fb3ebf9858128363d

rm -rf libsodium
git clone https://github.com/jedisct1/libsodium.git -b ${version}

