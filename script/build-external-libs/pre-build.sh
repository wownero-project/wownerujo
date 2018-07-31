#!/usr/bin/env bash

set -e

script/build-external-libs/clean.sh

script/build-external-libs/pre-build-openssl.sh
script/build-external-libs/pre-build-boost.sh
script/build-external-libs/pre-build-wownero.sh


