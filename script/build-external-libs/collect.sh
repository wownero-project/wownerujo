#!/usr/bin/env bash

set -e


cd external-libs

find . -name "*.a" -exec rm {} \;
find . -name "*.h" -exec rm {} \;

./collect.sh
