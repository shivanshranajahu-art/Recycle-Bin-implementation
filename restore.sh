#!/bin/bash

TRASH_DIR="$HOME/Recycle-Bin-implementation/.trash"

if [ $# -eq 0 ]; then
  echo "Usage: ./restore.sh <filename>"
  exit 1
fi

FILE_TO_RESTORE="$TRASH_DIR/$1"

if [ -f "$FILE_TO_RESTORE" ]; then
  mv "$FILE_TO_RESTORE" ./
  echo "Restored '$1' to current directory."
else
  echo "'$1' not found in Recycle Bin."
fi
