#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

script/build-external-libs/prep-toolchain.sh

script/build-external-libs/build-openssl.sh
script/build-external-libs/post-build-openssl.sh

script/build-external-libs/build-boost.sh

script/build-external-libs/build-wownero.sh

script/build-external-libs/collect.sh


