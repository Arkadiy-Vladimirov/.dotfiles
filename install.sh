#!/usr/bin/env bash

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add Homebrew to your PATH:
echo >> "$HOME/.zprofile"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"

# add Homebrew to PATH of this local shell (executing this script)
eval "$(/opt/homebrew/bin/brew shellenv)"

# update brew
brew update

# install things
brew install stow tmux fish neovim

# install terminal
brew install --cask ghostty

# lsp servers for nvim
brew install basedpyright

# stow things (run inside .dotdiles folder)
stow tmux
stow fish
stow nvim
stow ghostty

# set up fish
command -v fish | sudo tee -a /etc/shells
chsh -s "$(command -v fish)"
