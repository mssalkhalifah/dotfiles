#!/bin/bash

# ANSI color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

if command_exists brew; then
  brew update && brew upgrade
  brew install node rust golang zsh ripgrep tmux kitty cargo
fi

if command_exists dnf; then
  sudo dnf update && sudo dnf upgrade
  sudo dnf install nodejs rust golang zsh ripgrep tmux kitty cargo
fi

if command_exists apt; then
  sudo apt update && sudo apt upgrade
  sudo apt install nodejs rustc golang zsh ripgrep tmux kitty cargo
fi

if ! [ -d "$HOME/.local/share/fonts" ]; then
  mkdir "$HOME/.local/share/fonts"
fi

cd "$HOME/Downloads" || exit 1

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
unzip "FiraCode.zip" -d "FiraCode"
cp -r "FiraCode" "$HOME/.local/share/fonts"
echo -e "${BLUE}Copied FiraCode fonts${NC}"

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip "JetBrainsMono.zip" -d "JetBrainsMono"
cp -r "JetBrainsMono" "$HOME/.local/share/fonts"
echo -e "${BLUE}Copied JetBrainsMono fonts${NC}"

fc-cache -fv

cd "$HOME" || exit 1

chsh -s "$(which zsh)"

echo -e "${GREEN}Installation complete!${NC}"
