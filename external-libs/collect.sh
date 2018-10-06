#!/bin/bash
#
#  -D BOOST_ROOT=/opt/android/boost_1_58_0

set -e

orig_path=$PATH
build_root=$EXTERNAL_LIBS_BUILD_ROOT

packages=(boost openssl monero libsodium)
archs=(arm arm64 x86_64)

for arch in ${archs[@]}; do
    case ${arch} in
        "arm")
			xarch="armeabi-v7a"
			;;
        "arm64")
			xarch="arm64-v8a"
            ;;
        "x86")
			xarch="x86"
            ;;
        "x86_64")
			xarch="x86_64"
            ;;
        *)
			exit 16
            ;;
    esac

	for package in ${packages[@]}; do
		OUTPUT_DIR=`pwd`/$package/lib/$xarch
		mkdir -p $OUTPUT_DIR
		rm -f $OUTPUT_DIR/*.a
		cp -a $build_root/build/$package/$arch/lib/*.a $OUTPUT_DIR

		if [ $package = "monero" -a -d "$build_root/build/$package/include" ]; then
			rm -rf $OUTPUT_DIR/../../include
		  cp -a $build_root/build/$package/include $OUTPUT_DIR/../..
		fi

	done
done
exit 0

