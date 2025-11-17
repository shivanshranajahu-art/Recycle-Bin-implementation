#!/bin/bash

# -------------------------------
# RECYCLE BIN IMPLEMENTATION
# Author : Shivansh Rana
# Description : A simple menu-driven recycle bin system in shell
# -------------------------------

RECYCLE_DIR="$HOME/.recycle_bin"

# Create recycle bin directory if it doesn't exist
if [ ! -d "$RECYCLE_DIR" ]; then
    mkdir "$RECYCLE_DIR"
fi

# Function to move file to recycle bin
delete_file() {
    read -p "Enter file name to delete: " file
    if [ -f "$file" ]; then
        mv "$file" "$RECYCLE_DIR/"
        echo "✅ File '$file' moved to Recycle Bin."
    else
        echo "❌ File not found!"
    fi
}

# Function to list files in recycle bin
list_files() {
    echo "🗑️ Files in Recycle Bin:"
    ls -l "$RECYCLE_DIR"
}

# Function to restore file
restore_file() {
    read -p "Enter file name to restore: " file
    if [ -f "$RECYCLE_DIR/$file" ]; then
        mv "$RECYCLE_DIR/$file" ./
        echo "♻️ File '$file' restored successfully."
    else
        echo "❌ File not found in Recycle Bin."
    fi
}

# Function to permanently delete a file
permanent_delete() {
    read -p "Enter file name to permanently delete: " file
    if [ -f "$RECYCLE_DIR/$file" ]; then
        rm "$RECYCLE_DIR/$file"
        echo "🗑️ File '$file' permanently deleted."
    else
        echo "❌ File not found in Recycle Bin."
    fi
}

# Function to empty recycle bin
empty_bin() {
    read -p "Are you sure you want to permanently delete all files? (y/n): " confirm
    if [ "$confirm" = "y" ]; then
        rm -rf "$RECYCLE_DIR"/*
        echo "♻️ Recycle Bin emptied."
    else
        echo "Cancelled."
    fi
}

# -------------------------------
# Menu-driven interface
# -------------------------------
while true; do
    echo "-------------------------------"
    echo "   🗑️ RECYCLE BIN MENU"
    echo "-------------------------------"
    echo "1. Delete a File"
    echo "2. List Files in Recycle Bin"
    echo "3. Restore a File"
    echo "4. Permanently Delete a File"
    echo "5. Empty Recycle Bin"
    echo "6. Exit"
    echo "-------------------------------"
    read -p "Enter your choice [1-6]: " choice

    case $choice in
        1) delete_file ;;
        2) list_files ;;
        3) restore_file ;;
        4) permanent_delete ;;
        5) empty_bin ;;
        6) echo "👋 Exiting..."; exit 0 ;;
        *) echo "❌ Invalid choice! Please try again." ;;
    esac
done
