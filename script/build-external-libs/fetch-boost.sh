#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

cd $EXTERNAL_LIBS_BUILD_ROOT

version=1_67_0
dot_version=1.67.0

rm -rf boost_${version}
wget https://dl.bintray.com/boostorg/release/${dot_version}/source/boost_${version}.tar.gz
tar xfz boost_${version}.tar.gz
