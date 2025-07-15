# Adds symlinks to directly use this repo's configurations into my prefered tools.

## Config files

mkdir -p ~/.zsh && ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
mkdir -p ~/.git && ln -sf $(pwd)/git/.gitconfig ~/.git
mkdir -p ~/.config/aerospace && ln -sf $(pwd)/tools/aerospace.toml ~/.aerospace.toml

## Editors

ln -sf $(pwd)/vscode/vscode-settings.json ~/Library/"Application Support"/Code/User/settings.json
