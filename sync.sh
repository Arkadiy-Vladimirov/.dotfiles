#!/usr/bin/env bash

set -euo pipefail

# ensure ~/.zprofile exists
touch "$HOME/.zprofile"

# Setup Homebrew
brew_init_line='eval "$(/opt/homebrew/bin/brew shellenv)"'
if ! grep -Fxq "$brew_init_line" "$HOME/.zprofile"; then
	# install Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	# add Homebrew to your PATH in future shells
	echo "$brew_init_line" >> "$HOME/.zprofile"
fi

# set BREW path for this local shell (executing this script)
export BREW=/opt/homebrew/

# add Homebrew to PATH of this shell
eval "$(${BREW}/bin/brew shellenv)"

# sync required things
brew bundle

# stow things
stow fish tmux nvim ghostty

# install tpm plugins
$BREW/opt/tpm/share/tpm/bin/install_plugins

# set up fish (idempotent)
fish_path="$(command -v fish)"

if ! grep -Fxq "$fish_path" /etc/shells; then
  echo "$fish_path" | sudo tee -a /etc/shells
fi

chsh -s "$fish_path"
