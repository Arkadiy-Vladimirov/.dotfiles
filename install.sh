#!/usr/bin/env bash

# set up fresh Homebrew (Linuxbrew) (idempotent)
brew_marker="# >>> homebrew init (dotfiles) >>>"

if ! grep -Fq "$brew_marker" "$HOME/.bashrc" 2>/dev/null; then
	# install Homebrew
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	# set up Homebrew init + PATH fix in .bashrc for future shells
	cat << 'EOF' >> "$HOME/.bashrc"

# >>> homebrew init (dotfiles) >>>
BREW_ROOT="/home/linuxbrew/.linuxbrew"

# Load Homebrew env (adds brew paths and variables)
eval "$(${BREW_ROOT}/bin/brew shellenv)"

# Move brew paths to the end of PATH (system tools first)
PATH=$(printf "%s" "$PATH" \
  | sed "s#$BREW_ROOT/bin:##g" \
  | sed "s#$BREW_ROOT/sbin:##g" \
  | sed "s#:$BREW_ROOT/bin##g" \
  | sed "s#:$BREW_ROOT/sbin##g")
PATH="$PATH:$BREW_ROOT/bin:$BREW_ROOT/sbin"
export PATH
# <<< homebrew init (dotfiles) <<<
EOF
fi

# add Homebrew to PATH of this local shell (executing this script)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# sync required things
brew bundle

# stow things
stow fish tmux nvim

# set up fish auto-start (idempotent)
fish_marker="# ---- auto-start fish (added by dotfiles install) ----"

if ! grep -Fq "$fish_marker" "$HOME/.bashrc" 2>/dev/null; then
  cat << 'EOF' >> "$HOME/.bashrc"

# ---- auto-start fish (added by dotfiles install) ----
if [ -t 1 ] && command -v fish >/dev/null 2>&1; then
  exec fish
fi
# ---- end auto-start fish ----
EOF
fi
