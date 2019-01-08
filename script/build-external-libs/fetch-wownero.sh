#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

base_dir=`pwd`

cd $EXTERNAL_LIBS_BUILD_ROOT


# url="$base_dir/vendor/wownero"
url="https://github.com/wownero/wownero"
# url="https://github.com/fuwa0529/wownero"
# url="https://github.com/wowario/wownero"
# version="v0.4.0.0"
version="d85d908"


rm -rf wownero
git clone $url wownero
cd wownero

git checkout $version
