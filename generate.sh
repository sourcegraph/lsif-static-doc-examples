#!/usr/bin/env bash
set -ex

rm -rf examples/

pushd repos/sourcegraph-sourcegraph && lsif-go && popd
mkdir -p examples/sourcegraph-sourcegraph
pushd examples/sourcegraph-sourcegraph
lsif-static-doc ../../repos/sourcegraph-sourcegraph/dump.lsif . .
popd

pushd repos/gorilla-mux && lsif-go && popd
mkdir -p examples/gorilla-mux
pushd examples/gorilla-mux
lsif-static-doc ../../repos/gorilla-mux/dump.lsif . .                         
popd

go clean -cache # https://github.com/golang/go/issues/45890
pushd repos/golang-go/src && lsif-go && popd
mkdir -p examples/golang-go
pushd examples/golang-go
lsif-static-doc ../../repos/golang-go/src/dump.lsif . .
popd
