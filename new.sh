#!/bin/bash

set -e

echo "Enter relative tweet filename (e.g. announce-something, YYYY/MM/ gets prepended)"
read -p '> ' slug

git checkout -b "$slug"

fname="tweets/$(date +%Y/%m)/${slug}.tweet"
mkdir -p $(dirname "$fname")
touch "$fname"
git add --intent-to-add "$fname"

sensible-editor $fname
git add "$fname"
