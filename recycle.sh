#!/bin/bash

TRASH_DIR="$HOME/Recycle-Bin-implementation/.trash"

if [ ! -d "$TRASH_DIR" ]; then
  mkdir -p "$TRASH_DIR"
fi

if [ $# -eq 0 ]; then
  echo "Usage: ./recycle.sh <file>"
  exit 1
fi

for file in "$@"; do
  if [ -f "$file" ]; then
    mv "$file" "$TRASH_DIR"/
    echo "Moved '$file' to Recycle Bin."
  else
    echo "'$file' not found."
  fi
done
