#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

cd $EXTERNAL_LIBS_BUILD_ROOT

# version="v0.2.2.0"

# url="https://github.com/wownero/wownero"
# branch-release-v0.3.0.0 (ring size 22)
# version="48bcb9"

url="https://github.com/wowario/wownero3"
version="61753be"

rm -rf wownero
git clone $url wownero
cd wownero

git checkout $version
