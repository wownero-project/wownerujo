# BUILDING external libs

Based on https://forum.getmonero.org/5/support/87643/building-monero-v0-10-3-1-for-android and the internet.

Do not follow this blindly.

These instructions are tailored to building ```wallep_api```.

These instructions build all supported architectures: ```'armeabi-v7a', 'arm64-v8a', 'x86', 'x86_64'```.

## Prepare Ubuntu environment

```Shell
sudo apt-get install build-essential cmake tofrodos libtool-bin
```

## Install Android NDK

* Install NDK: <https://developer.android.com/ndk/guides/>
* set `$ANDROID_NDK_ROOT`, for example:

```Shell
export $ANDROID_NDK_ROOT=~/Android/Sdk/ndk-bundle
```

## Build

```Shell
make
```
