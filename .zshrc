# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.cargo/env:$HOME/.tools/lua-language-server/bin:/usr/local/go/bin:$PATH"
export JAVA_HOME=""

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load Angular CLI autocompletion.
if command -v ng &> /dev/null; then
    source <(ng completion script)
fi

alias vim="$HOME/.dotfiles/Applications/nvim.appimage"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ll="ls -la"
alias python=python3
alias pip=pip3

# Start pure
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure
