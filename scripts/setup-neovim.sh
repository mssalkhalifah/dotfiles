!#/bin/sh

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

mkdir -p $HOME/.local/bin
tar -xzf nvim-linux-x86_64.tar.gz
cp nvim-linux-x86_64/bin/nvim $HOME/.local/bin/nvim

rm -rf nvim-linux-x86_64
rm nvim-linux-x86_64.tar.gz
