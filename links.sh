# Adds symlinks to directly use this repo's configurations into my prefered tools.

## Config files

ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
ln -sf $(pwd)/git/.gitconfig ~/.git

## Editors

ln -sf $(pwd)/vscode/vscode-settings.json ~/Library/"Application Support"/Code/User/settings.json
