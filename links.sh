# Adds symlinks to directly use this repo's configurations into my prefered tools.

## Config files

mkdir -p ~/.zsh && ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
mkdir -p ~/.git && ln -sf $(pwd)/git/.gitconfig ~/.gitconfig

mkdir -p ~/.config/aerospace && ln -sf $(pwd)/.config/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml
mkdir -p ~/.config/ghostty && ln -sf $(pwd)/.config/ghostty/config ~/.config/ghostty/config
mkdir -p ~/.config/tmux && ln -sf $(pwd)/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf

## Editors


## Scripts

mkdir -p ~/bin
ln -sf $(pwd)/bin/wsw ~/bin/wsw
ln -sf $(pwd)/bin/wss ~/bin/wss
