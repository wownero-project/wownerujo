#!/usr/bin/env bash

set -e

cd $EXTERNAL_LIBS_BUILD_ROOT

# version="618dea"
version="326cde"

rm -rf wownero
git clone -b mobile https://github.com/fuwa0529/wownero
cd wownero

git checkout $version
git submodule init && git submodule update
