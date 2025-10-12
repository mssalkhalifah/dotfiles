#!/bin/bash
# setup-popeye.sh
# Script to install Popeye (Kubernetes cluster sanitizer) version 0.22.1 on Linux (RPM-based)

set -e

# Define variables
POPEYE_VERSION="v0.22.1"
POPEYE_RPM_URL="https://github.com/derailed/popeye/releases/download/${POPEYE_VERSION}/popeye_linux_amd64.rpm"
TMP_DIR="/tmp/popeye_install"

echo "🚀 Starting Popeye installation (version ${POPEYE_VERSION})..."

# Create temporary directory
mkdir -p "$TMP_DIR"
cd "$TMP_DIR"

# Download the RPM package
echo "📥 Downloading Popeye RPM package..."
curl -L -o popeye_linux_amd64.rpm "$POPEYE_RPM_URL"

# Install Popeye using dnf or yum
if command -v dnf >/dev/null 2>&1; then
  echo "📦 Installing with dnf..."
  sudo dnf install -y ./popeye_linux_amd64.rpm
elif command -v yum >/dev/null 2>&1; then
  echo "📦 Installing with yum..."
  sudo yum install -y ./popeye_linux_amd64.rpm
else
  echo "❌ Neither dnf nor yum found. Please install manually."
  exit 1
fi

# Verify installation
echo "✅ Verifying installation..."
if command -v popeye >/dev/null 2>&1; then
  popeye version
  echo "🎉 Popeye installed successfully!"
else
  echo "❌ Installation failed: Popeye not found in PATH."
  exit 1
fi

# Cleanup
echo "🧹 Cleaning up temporary files..."
rm -rf "$TMP_DIR"

echo "✨ Done!"
