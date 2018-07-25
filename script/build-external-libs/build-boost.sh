#!/bin/sh

cd /opt/android/boost_1_58_0

PATH=/opt/android/tool/arm/arm-linux-androideabi/bin:/opt/android/tool/arm/bin:$PATH      ./b2 --build-type=minimal link=static runtime-link=static --with-chrono --with-date_time --with-filesystem --with-program_options --with-regex --with-serialization --with-system --with-thread --build-dir=android-arm    --prefix=/opt/android/build/boost/arm    --includedir=/opt/android/build/boost/include toolset=clang threading=multi threadapi=pthread target-os=android install
ln -sf ../include /opt/android/build/boost/arm
PATH=/opt/android/tool/arm64/aarch64-linux-android/bin:/opt/android/tool/arm64/bin:$PATH  ./b2 --build-type=minimal link=static runtime-link=static --with-chrono --with-date_time --with-filesystem --with-program_options --with-regex --with-serialization --with-system --with-thread --build-dir=android-arm64  --prefix=/opt/android/build/boost/arm64  --includedir=/opt/android/build/boost/include toolset=clang threading=multi threadapi=pthread target-os=android install
ln -sf ../include /opt/android/build/boost/arm64
PATH=/opt/android/tool/x86/i686-linux-android/bin:/opt/android/tool/x86/bin:$PATH         ./b2 --build-type=minimal link=static runtime-link=static --with-chrono --with-date_time --with-filesystem --with-program_options --with-regex --with-serialization --with-system --with-thread --build-dir=android-x86    --prefix=/opt/android/build/boost/x86    --includedir=/opt/android/build/boost/include toolset=clang threading=multi threadapi=pthread target-os=android install
ln -sf ../include /opt/android/build/boost/x86
PATH=/opt/android/tool/x86_64/x86_64-linux-android/bin:/opt/android/tool/x86_64/bin:$PATH ./b2 --build-type=minimal link=static runtime-link=static --with-chrono --with-date_time --with-filesystem --with-program_options --with-regex --with-serialization --with-system --with-thread --build-dir=android-x86_64 --prefix=/opt/android/build/boost/x86_64 --includedir=/opt/android/build/boost/include toolset=clang threading=multi threadapi=pthread target-os=android install
ln -sf ../include /opt/android/build/boost/x86_64
