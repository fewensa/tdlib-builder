#!/bin/sh
#
#


set -xe

BIN_PATH=$(dirname $(readlink -f $0))

VERSION=$1

git clone https://github.com/tdlib/td.git
cd td

git checkout -b tags/${VERSION} ${VERSION}

rm -rf build
mkdir build

cd td/build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
cmake --build . --target install



