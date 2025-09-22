#!/bin/sh

# Define the installation directory
INSTALL_DIR="/opt/nvim-linux-x86_64"
NVIM_BIN="/opt/nvim-linux-x86_64/bin/nvim"

# Function to prompt user for confirmation
prompt_yes_no() {
    read -p "$1 (y/n): " answer
    case $answer in
        [Yy]* ) return 0;;
        [Nn]* ) return 1;;
        * ) echo "Please answer y or n."; prompt_yes_no "$1";;
    esac
}

# Check if Neovim is already installed
if [ -f "$NVIM_BIN" ]; then
    echo "Neovim is already installed at $INSTALL_DIR."
    prompt_yes_no "Do you want to remove and reinstall Neovim?" || exit 0
    echo "Removing existing Neovim installation..."
    sudo rm -rf "$INSTALL_DIR"
fi

# Download the Neovim tarball
echo "Downloading Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

# Extract the tarball to the target directory
echo "Extracting Neovim..."
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Clean up the tarball
echo "Cleaning up..."
rm nvim-linux-x86_64.tar.gz

# Add the Neovim binary path to the shell configuration
echo "Updating shell config to add Neovim to PATH..."

# Choose the appropriate shell configuration file
if [ -f ~/.bashrc ]; then
    SHELL_CONFIG=~/.bashrc
elif [ -f ~/.zshrc ]; then
    SHELL_CONFIG=~/.zshrc
else
    echo "No recognized shell configuration file found (bashrc or zshrc)."
    exit 1
fi

# Update the PATH in the shell config
echo "export PATH=\"\$PATH:$INSTALL_DIR/bin\"" >> "$SHELL_CONFIG"

# Source the shell config to apply changes
echo "Sourcing the shell config..."
source "$SHELL_CONFIG"

echo "Neovim installation complete! You can now run 'nvim' from the terminal."
