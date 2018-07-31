#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

cd external-libs

find . -name "*.a" -exec rm {} \;
find . -name "*.h" -exec rm {} \;

./collect.sh
