#!/usr/bin/env bash

set -e

cd $EXTERNAL_LIBS_BUILD_ROOT
cd android-openssl

./build-all-arch.sh
