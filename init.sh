#!/usr/bin/env bash

current_name=$(basename "$PWD")
new_name=${1:-}

if [[ -z $new_name ]]; then
    echo "error: add the name you'd like to initialize the template too" 
    exit 1;
fi

rm -rf .git

cd ../

mv "$current_name" "$new_name"

cd -

git init

git branch -M main
