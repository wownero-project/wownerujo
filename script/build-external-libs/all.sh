#!/bin/sh

script/prep-toolchain.sh
script/build-openssl.sh
script/post-build-openssl.sh
script/pre-build-boost.sh
script/build-boost.sh
# script/build-monero.sh
script/build-wownero.sh
