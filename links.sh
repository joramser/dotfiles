# Adds symlinks to directly use this repo's configurations into my prefered tools.

## Config files

mkdir -p ~/.zsh && ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
mkdir -p ~/.git && ln -sf $(pwd)/git/.gitconfig ~/.gitconfig

mkdir -p ~/.config/aerospace && ln -sf $(pwd)/.config/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml
mkdir -p ~/.config/ghostty && ln -sf $(pwd)/.config/ghostty/config ~/.config/ghostty/config
mkdir -p ~/.config/herdr && ln -sf $(pwd)/.config/herdr/config.toml ~/.config/herdr/config.toml
mkdir -p ~/.config/mise && ln -sf $(pwd)/.config/mise/config.toml ~/.config/mise/config.toml
mkdir -p ~/.config/tmux && ln -sf $(pwd)/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf

## Editors
mkdir -p ~/.config/zed && ln -sf $(pwd)/.config/zed/settings.json ~/.config/zed/settings.json
mkdir -p ~/.config/zed && ln -sf $(pwd)/.config/zed/keymap.json ~/.config/zed/keymap.json

## Scripts
mkdir -p ~/bin
ln -sf $(pwd)/bin/wsw ~/bin/wsw
ln -sf $(pwd)/bin/wss ~/bin/wss
ln -sf $(pwd)/bin/tmux-session-picker ~/bin/tmux-session-picker
