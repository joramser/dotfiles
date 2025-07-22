# Adds symlinks to directly use this repo's configurations into my prefered tools.

## Config files

mkdir -p ~/.zsh && ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
mkdir -p ~/.git && ln -sf $(pwd)/git/.gitconfig ~/.git

mkdir -p ~/.config/aerospace && ln -sf $(pwd)/.config/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml
mkdir -p ~/.config/ghostty && ln -sf $(pwd)/.config/ghostty/config ~/.config/ghostty/config

## Editors

ln -sf $(pwd)/vscode/vscode-settings.json ~/Library/"Application Support"/Code/User/settings.json
