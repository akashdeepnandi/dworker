#!/bin/sh
## Separate script to handle nvim version change

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim;
wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz 
mkdir -p .local/bin
mkdir -p .local/nvim
cp -r nvim-linux64/* ~/.local/nvim
# $HOME/.local/nvim/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
# $HOME/.local/nvim/bin/nvim --headless -c 'TSUpdate'
# cd $HOME/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim
# make
# cd

