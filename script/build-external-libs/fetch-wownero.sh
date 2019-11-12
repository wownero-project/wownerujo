#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

base_dir=`pwd`

cd $EXTERNAL_LIBS_BUILD_ROOT


# url="$base_dir/vendor/wownero"
url="https://github.com/wownero/wownero"
version="v0.7.0"


rm -rf wownero
git clone $url wownero
cd wownero

git checkout $version
