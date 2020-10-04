#!/bin/bash

set -e

echo "Enter relative tweet filename (e.g. YYYY/MM/announce-something)"
read -p '> ' slug

git checkout -b "$slug"

fname="tweets/${slug}.tweet"
mkdir -p $(dirname "$fname")
touch "$fname"
git add --intent-to-add "$fname"

sensible-editor $fname
git add "$fname"
