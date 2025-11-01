#!/bin/bash

TRASH_DIR="$HOME/Recycle-Bin-implementation/.trash"

if [ "$(ls -A $TRASH_DIR)" ]; then
  echo "Files in Recycle Bin:"
  ls -l "$TRASH_DIR"
else
  echo "Recycle Bin is empty."
fi
