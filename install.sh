#!/usr/bin/env bash

set -euo pipefail

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ensure ~/.zprofile exists
touch "$HOME/.zprofile"

# add Homebrew to your PATH in future shells (idempotent)
brew_init_line='eval "$(/opt/homebrew/bin/brew shellenv)"'
if ! grep -Fxq "$brew_init_line" "$HOME/.zprofile"; then
  echo "$brew_init_line" >> "$HOME/.zprofile"
fi

# add Homebrew to PATH of this local shell (executing this script)
eval "$(/opt/homebrew/bin/brew shellenv)"

# update brew
brew update

# install things
brew install stow tmux fish neovim

# language servers for nvim
brew install lua-language-server
brew install basedpyright
brew install ruff

# rg for telescope.nvim
brew install ripgrep

# stow things (run inside .dotfiles folder)
stow tmux
stow fish
stow nvim
stow ghostty

# set up fish (idempotent)
fish_path="$(command -v fish)"

if ! grep -Fxq "$fish_path" /etc/shells; then
  echo "$fish_path" | sudo tee -a /etc/shells
fi

chsh -s "$fish_path"
