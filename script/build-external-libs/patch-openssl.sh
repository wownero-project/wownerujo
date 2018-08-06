#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

cp script/build-external-libs/android-openssl/build-all-arch.sh \
   $EXTERNAL_LIBS_BUILD_ROOT/android-openssl
cp script/build-external-libs/android-openssl/setenv-android-mod.sh \
   $EXTERNAL_LIBS_BUILD_ROOT/android-openssl
