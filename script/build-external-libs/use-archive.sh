#!/usr/bin/env bash

set -e

rm -rf external-libs
curl -O -L https://github.com/fuwa0529/wownerujo/releases/download/v1.5.10.4/external-libs.tgz
tar zxfv external-libs.tgz
rm external-libs.tgz
