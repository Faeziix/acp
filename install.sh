#!/bin/bash

set -e

tmp_dir=$(mktemp -d)

cleanup() {
  rm -rf "$tmp_dir"
}

trap cleanup EXIT INT TERM

curl -sL "https://raw.githubusercontent.com/faeziix/acp/main/PKGBUILD" -o "$tmp_dir/PKGBUILD"

cd "$tmp_dir"
makepkg -si

