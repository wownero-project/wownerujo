#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

build_root=$EXTERNAL_LIBS_BUILD_ROOT

rm -rf $build_root
mkdir -p $build_root
