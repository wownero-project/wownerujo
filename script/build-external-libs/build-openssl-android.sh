#! /usr/bin/env bash

# credit:
# https://github.com/willyliu/build-openssl-android
# modified for building for wownero

MINIMUM_ANDROID_SDK_VERSION=$1
MINIMUM_ANDROID_64_BIT_SDK_VERSION=$2
OPENSSL_FULL_VERSION="openssl-1.1.0h"

if [ ! -f "$OPENSSL_FULL_VERSION.tar.gz" ]; then
    curl -O https://www.openssl.org/source/$OPENSSL_FULL_VERSION.tar.gz
fi
tar -xvzf $OPENSSL_FULL_VERSION.tar.gz

(cd $OPENSSL_FULL_VERSION;

 if [ ! ${MINIMUM_ANDROID_SDK_VERSION} ]; then
     echo "MINIMUM_ANDROID_SDK_VERSION was not provided, include and rerun"
     exit 1
 fi

 if [ ! ${MINIMUM_ANDROID_64_BIT_SDK_VERSION} ]; then
     echo "MINIMUM_ANDROID_64_BIT_SDK_VERSION was not provided, include and rerun"
     exit 1
 fi

 if [ ! ${ANDROID_NDK_ROOT} ]; then
     echo "ANDROID_NDK_ROOT environment variable not set, set and rerun"
     exit 1
 fi

 ANDROID_LIB_ROOT=../../build/openssl
 ANDROID_TOOLCHAIN_DIR=/tmp/android-toolchain
 OPENSSL_CONFIGURE_OPTIONS="no-asm \
        shared no-threads no-asm no-zlib no-ssl2 no-ssl3 no-comp no-hw no-engine \
        -fPIC -DOPENSSL_PIC -DDSO_DLFCN -DHAVE_DLFCN_H -mandroid \
        -O"

 HOST_INFO=`uname -a`
 case ${HOST_INFO} in
     Darwin*)
         TOOLCHAIN_SYSTEM=darwin-x86
         ;;
     Linux*)
         if [[ "${HOST_INFO}" == *i686* ]]
         then
             TOOLCHAIN_SYSTEM=linux-x86
         else
             TOOLCHAIN_SYSTEM=linux-x86_64
         fi
         ;;
     *)
         echo "Toolchain unknown for host system"
         exit 1
         ;;
 esac

 rm -rf ${ANDROID_LIB_ROOT}

 # copy header
 mkdir -p "${ANDROID_LIB_ROOT}/include/openssl"
 cp -r "include/openssl" "${ANDROID_LIB_ROOT}/include/"

 ./Configure dist

 archs=(arm64)
 # archs=(arm arm64 x86_64)

 for ANDROID_TARGET_PLATFORM in ${archs[@]}; do
     echo "Building for libcrypto.a and libssl.a for ${ANDROID_TARGET_PLATFORM}"
     case "${ANDROID_TARGET_PLATFORM}" in
         arm)
             TOOLCHAIN_ARCH=arm
             TOOLCHAIN_PREFIX=arm-linux-androideabi
             CONFIGURE_ARCH=android
             PLATFORM_OUTPUT_DIR=armeabi-v7a
             ANDROID_API_VERSION=${MINIMUM_ANDROID_SDK_VERSION}
             ;;
         arm64)
             TOOLCHAIN_ARCH=arm64
             TOOLCHAIN_PREFIX=aarch64-linux-android
             CONFIGURE_ARCH=android64-aarch64
             PLATFORM_OUTPUT_DIR=arm64
             ANDROID_API_VERSION=${MINIMUM_ANDROID_64_BIT_SDK_VERSION}
             ;;
         x86_64)
             TOOLCHAIN_ARCH=x86_64
             TOOLCHAIN_PREFIX=x86_64-linux-android
             CONFIGURE_ARCH=android64
             PLATFORM_OUTPUT_DIR=x86_64
             ANDROID_API_VERSION=${MINIMUM_ANDROID_64_BIT_SDK_VERSION}
             ;;
         *)
             echo "Unsupported build platform:${ANDROID_TARGET_PLATFORM}"
             exit 1
     esac

     rm -rf ${ANDROID_TOOLCHAIN_DIR}
     mkdir -p "${ANDROID_LIB_ROOT}/${PLATFORM_OUTPUT_DIR}/lib"
     python ${ANDROID_NDK_ROOT}/build/tools/make_standalone_toolchain.py \
            --arch ${TOOLCHAIN_ARCH} \
            --api ${ANDROID_API_VERSION} \
            --install-dir ${ANDROID_TOOLCHAIN_DIR}

     if [ $? -ne 0 ]; then
         echo "Error executing make_standalone_toolchain.py for ${TOOLCHAIN_ARCH}"
         exit 1
     fi

     export PATH=${ANDROID_TOOLCHAIN_DIR}/bin:$PATH
     export CROSS_SYSROOT=${ANDROID_TOOLCHAIN_DIR}/sysroot

     RANLIB=${TOOLCHAIN_PREFIX}-ranlib \
           AR=${TOOLCHAIN_PREFIX}-ar \
           CC=${TOOLCHAIN_PREFIX}-gcc \
           ./Configure "${CONFIGURE_ARCH}" \
           -D__ANDROID_API__=${ANDROID_API_VERSION} \
           "${OPENSSL_CONFIGURE_OPTIONS}"

     if [ $? -ne 0 ]; then
         echo "Error executing:./Configure ${CONFIGURE_ARCH} ${OPENSSL_CONFIGURE_OPTIONS}"
         exit 1
     fi

     make clean
     # make depend
     make -j $NPROC

     if [ $? -ne 0 ]; then
         echo "Error executing make for platform:${ANDROID_TARGET_PLATFORM}"
         exit 1
     fi

     mv libcrypto.a ${ANDROID_LIB_ROOT}/${PLATFORM_OUTPUT_DIR}/lib
     mv libssl.a ${ANDROID_LIB_ROOT}/${PLATFORM_OUTPUT_DIR}/lib
 done
)
