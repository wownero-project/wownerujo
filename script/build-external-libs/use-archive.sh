#!/usr/bin/env bash

set -e

version=v1.5.10.4
rm -rf external-libs
curl -O -L https://github.com/fuwa0529/wownerujo/releases/download/${version}/external-libs.tgz
tar zxfv external-libs.tgz
rm external-libs.tgz
