#!/bin/bash

TRASH_DIR="$HOME/Recycle-Bin-implementation/.trash"

read -p "Are you sure you want to empty the Recycle Bin? (y/n): " confirm
if [ "$confirm" == "y" ]; then
  rm -rf "$TRASH_DIR"/*
  echo "Recycle Bin emptied."
else
  echo "Operation cancelled."
fi
