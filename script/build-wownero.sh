#!/bin/sh

cd /opt/android
git clone --recursive -b wownerojo ~/scm/vendor/wownero


cd wownero

./build-all-arch.sh
