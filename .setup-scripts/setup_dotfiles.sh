#!/bin/bash

# Specify the destination directory for your dotfiles (usually the home directory)
DOTFILES_DIR="$HOME"

# Backup existing dotfiles
backup_dotfiles() {
    echo "Backing up existing dotfiles..."
    mv "$DOTFILES_DIR/.bashrc" "$DOTFILES_DIR/.bashrc.backup" 2>/dev/null
    mv "$DOTFILES_DIR/.vimrc" "$DOTFILES_DIR/.vimrc.backup" 2>/dev/null
    mv "$DOTFILES_DIR/.zshrc" "$DOTFILES_DIR/.zshrc.backup" 2>/dev/null
}

# Create symbolic links to dotfiles
create_symlinks() {
    echo "Creating symbolic links..."
    ln -sf "$DOTFILES_DIR/.config/nvchad-custom" "$DOTFILES_DIR/.config/nvim/lua/custom"
}

apply_permissions() {
    chmod +x "$DOTFILES_DIR/.dotfiles/Applications/nvim.appimage"
}

# Main function
main() {
    backup_dotfiles
    create_symlinks
    apply_permissions
    echo "Dotfiles setup complete!"
}

main
