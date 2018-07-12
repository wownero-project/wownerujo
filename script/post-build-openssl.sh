#!/bin/sh

mkdir -p /opt/android/build/openssl/{arm,arm64,x86,x86_64}

cp -a /opt/android/android-openssl/prebuilt/armeabi   /opt/android/build/openssl/arm/lib
cp -a /opt/android/android-openssl/prebuilt/arm64-v8a /opt/android/build/openssl/arm64/lib
cp -a /opt/android/android-openssl/prebuilt/x86       /opt/android/build/openssl/x86/lib
cp -a /opt/android/android-openssl/prebuilt/x86_64    /opt/android/build/openssl/x86_64/lib
cp -aL /opt/android/android-openssl/openssl-OpenSSL_1_0_2l/include/openssl/ /opt/android/build/openssl/include
ln -s /opt/android/build/openssl/include /opt/android/build/openssl/arm/include
ln -s /opt/android/build/openssl/include /opt/android/build/openssl/arm64/include
ln -s /opt/android/build/openssl/include /opt/android/build/openssl/x86/include
ln -s /opt/android/build/openssl/include /opt/android/build/openssl/x86_64/include


ln -sf /opt/android/build/openssl/include /opt/android/tool/arm/sysroot/usr/include/openssl
ln -sf /opt/android/build/openssl/arm/lib/*.so /opt/android/tool/arm/sysroot/usr/lib

ln -sf /opt/android/build/openssl/include /opt/android/tool/arm64/sysroot/usr/include/openssl
ln -sf /opt/android/build/openssl/arm64/lib/*.so /opt/android/tool/arm64/sysroot/usr/lib

ln -sf /opt/android/build/openssl/include /opt/android/tool/x86/sysroot/usr/include/openssl
ln -sf /opt/android/build/openssl/x86/lib/*.so /opt/android/tool/x86/sysroot/usr/lib

ln -sf /opt/android/build/openssl/include /opt/android/tool/x86_64/sysroot/usr/include/openssl
ln -sf /opt/android/build/openssl/x86_64/lib/*.so /opt/android/tool/x86_64/sysroot/usr/lib64
