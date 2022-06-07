#!/bin/sh

git clone https://github.com/akashdeepnandi/dotfiles
cd ~/dotfiles
stow -R nvim
rm -rf ~/.bashrc ~/.zshrc
stow -R shell
stow -R tmux
stow -R starship
cd 
wget https://go.dev/dl/go1.18.2.linux-amd64.tar.gz
tar -C $HOME/.local -xzf go1.18.2.linux-amd64.tar.gz
EXPORT PATH=$HOME/.local/go/bin:$PATH

# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# \. ${HOME}/.nvm/nvm.sh
#
# nvm i 16.15.0
# # Enable yarn
# corepack enable

$HOME/.local/nvim/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
cd $HOME/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim
make
cd
# $HOME/.local/nvim/bin/nvim -c "TSInstallSync all" -c q
# $HOME/.local/nvim/bin/nvim --headless -c "LspInstall --sync jsonls sumneko_lua tsserver dockerls elixirls gopls bashls html pyright solidity_ls svelte tailwindcss vuels yamlls" -c q

chmod +x ~/starship.install.sh && ~/starship.install.sh --yes --bin-dir "$HOME/.local/bin"
