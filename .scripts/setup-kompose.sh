#!/bin/sh

# Set Kompose version
VERSION="1.36.0"

# Detect OS and Architecture
OS=$(uname -s)
ARCH=$(uname -m)

# Set download URL based on OS and architecture
if [[ "$OS" == "Darwin" ]]; then
  if [[ "$ARCH" == "arm64" ]]; then
    FILE="kompose-darwin-arm64"
  else
    FILE="kompose-darwin-amd64"
  fi
elif [[ "$OS" == "Linux" ]]; then
  if [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
    FILE="kompose-linux-arm64"
  else
    FILE="kompose-linux-amd64"
  fi
else
  echo "Unsupported OS: $OS"
  exit 1
fi

# Build full download URL
URL="https://github.com/kubernetes/kompose/releases/download/v${VERSION}/${FILE}"

# Download and install
echo "Downloading Kompose v${VERSION} from: $URL"
curl -L "$URL" -o kompose
chmod +x kompose
sudo mv ./kompose /usr/local/bin/kompose

echo "Kompose ${VERSION} installed successfully!"
