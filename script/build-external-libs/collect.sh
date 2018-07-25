#!/bin/sh


cd external-libs

find . -name "*.a" -exec rm {} \;
find . -name "*.h" -exec rm {} \;

./collect.sh
