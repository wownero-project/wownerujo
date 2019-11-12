#!/usr/bin/env bash

set -e

source script/build-external-libs/env.sh

cd $EXTERNAL_LIBS_BUILD_ROOT
cd wownero

sed -i 's/-Werror/-Wall/g' CMakeLists.txt
sed -i 's/program_options locale/program_options/g' CMakeLists.txt
sed -i 's/bool create_address_file = false/bool create_address_file = true/g' src/wallet/wallet2.h

sodium_pattern="find_library(SODIUM_LIBRARY sodium)"
include_sodium='find_library(SODIUM_LIBRARY sodium)\
\
message(STATUS "Using SODIUM include dir at ${LIBSODIUM_INCLUDE_DIR}")\
include_directories(${LIBSODIUM_INCLUDE_DIR})'

sed -i "s/${sodium_pattern}/${include_sodium}/g" CMakeLists.txt
