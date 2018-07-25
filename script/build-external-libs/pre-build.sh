#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

script/build-external-libs/clean.sh

script/build-external-libs/pre-build-openssl.sh
script/build-external-libs/pre-build-boost.sh
script/build-external-libs/pre-build-wownero.sh


