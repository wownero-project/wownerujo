#!/bin/sh

cd $EXTERNAL_LIBS_BUILD_ROOT

git clone --recursive -b mobile https://github.com/fuwa0529/wownero

cd wownero

./build-all-arch.sh
