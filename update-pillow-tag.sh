#!/usr/bin/env bash

set -e # exit on error

if [ $# -eq 0 ]; then
    echo "Usage: update-pillow-tag.sh [[release tag]]"
    exit
fi

git checkout master
git submodule init
git submodule update Pillow
cd Pillow
git fetch --all
git checkout $1
cd ..
git commit -m "Pillow -> $1" Pillow
git push
