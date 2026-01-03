# Use Vi mode
set --global fish_key_bindings fish_vi_key_bindings

# Bind Ctrl-E to perform completion
bind -M insert \ce end-of-line

# Add local binaries to fish path
fish_add_path -m ~/.local/bin
