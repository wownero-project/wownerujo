#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

base_dir=`pwd`

cd $EXTERNAL_LIBS_BUILD_ROOT


# url="$base_dir/vendor/wownero"
url="https://github.com/wownero/wownero"
# url="https://github.com/wowario/wownero"
# version="v0.2.2.0"
version="bbf58dd"


rm -rf wownero
git clone $url wownero
cd wownero

git checkout $version
