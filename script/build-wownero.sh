#!/bin/sh

cd /opt/android
git clone --recursive -b wownerojo https://github.com/fuwa0529/wownero


cd wownero

./build-all-arch.sh
