#!/usr/bin/env bash

# install Homebrew (Linuxbrew)
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add Homebrew to your PATH:
echo >> "$HOME/.bashrc"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.bashrc"

# add Homebrew to PATH of this local shell (executing this script)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# update brew
brew update

# install things
brew install stow tmux fish neovim

# lsp servers for nvim
brew install lua-language-server
brew install basedpyright
brew install ruff

# stow things
stow tmux
stow fish
stow nvim

# set up fish auto-start
cat << 'EOF' >> "$HOME/.bashrc"

# ---- auto-start fish (added by dotfiles install) ----
if [ -t 1 ] && command -v fish >/dev/null 2>&1; then
  exec fish
fi
# ---- end auto-start fish ----

EOF
