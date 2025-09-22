#!/bin/bash
# Script to install Swaks (packaged method)

set -e

# Variables
URL="https://jetmore.org/john/code/swaks/files/swaks-20240103.0.tar.gz"
PKG_NAME="swaks-20240103.0"
TAR_FILE="${PKG_NAME}.tar.gz"

echo "Downloading Swaks package..."
curl -O "$URL"

echo "Extracting package..."
tar -xvzf "$TAR_FILE"

echo "Setting permissions..."
chmod 755 "./${PKG_NAME}/swaks"

echo "Moving binary to /usr/local/bin (requires sudo)..."
sudo cp "./${PKG_NAME}/swaks" /usr/local/bin/

echo "Cleaning up..."
rm -f "$TAR_FILE"
rm -rf "$PKG_NAME"

echo "Installation complete. Test with: swaks --version"
