#!/bin/bash

# ANSI color codes
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

if command_exists brew; then
  brew update && brew upgrade
  brew install node rust golang zsh ripgrep tmux kitty
fi

if command_exists dnf; then
  sudo dnf update && sudp dnf upgrade
  sudo dnf install -y nodejs rust golang zsh ripgrep tmux kitty
fi

if command_exists apt; then
  sudo apt update && sudo apt upgrade
  sudo apt install -y nodejs rustc golang zsh ripgrep tmux kitty
fi

if ! [ -d $HOME/.config/nvim/lua/custom ]; then
  ln -s $HOME/.config/nvchad-custom $HOME/.config/nvim/lua/custom
fi

chsh -s "$(which zsh)"

echo -e "${GREEN}Installation complete!${NC}"
