# Adds symlinks to directly use this repo's configurations into my prefered tools.

## Config files

mkdir -p ~/.zsh && ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
mkdir -p ~/.git && ln -sf $(pwd)/git/.gitconfig ~/.gitconfig

mkdir -p ~/.config/aerospace && ln -sf $(pwd)/.config/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml
mkdir -p ~/.config/ghostty && ln -sf $(pwd)/.config/ghostty/config ~/.config/ghostty/config
mkdir -p ~/.config/tmux && ln -sf $(pwd)/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf

## Editors

ln -sf $(pwd)/vscode/vscode-settings.json ~/Library/"Application Support"/Code/User/settings.json
mkdir -p ~/.config/zed && ln -sf $(pwd)/.config/zed/settings.json ~/.config/zed/settings.json
