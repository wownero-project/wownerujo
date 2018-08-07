#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

cd $EXTERNAL_LIBS_BUILD_ROOT

version="v0.2.2.0"

rm -rf wownero
git clone https://github.com/wownero/wownero
cd wownero

git checkout $version
