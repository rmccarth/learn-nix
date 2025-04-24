#!/bin/bash

set -e

for i in $(cat packages.txt); do
  brew install "${i}"
done

echo "[INFO] done"
