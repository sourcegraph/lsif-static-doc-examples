#!/usr/bin/env bash
set -ex

mkdir -p repos/
git clone https://github.com/sourcegraph/sourcegraph repos/sourcegraph-sourcegraph
git clone https://github.com/gorilla/mux repos/gorilla-mux
git clone https://github.com/golang/go repos/golang-go
