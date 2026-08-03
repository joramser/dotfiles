#!/usr/bin/env sh

set -eu

repo_dir=$(cd "$(dirname "$0")" && pwd)
config_home=${XDG_CONFIG_HOME:-"$HOME/.config"}

link() {
  source_file=$1
  destination=$2

  if [ ! -e "$source_file" ]; then
    printf 'Missing source file: %s\n' "$source_file" >&2
    exit 1
  fi

  if [ -e "$destination" ] && [ ! -L "$destination" ]; then
    printf 'Refusing to replace existing file: %s\n' "$destination" >&2
    exit 1
  fi

  mkdir -p "$(dirname "$destination")"
  ln -sfn "$source_file" "$destination"
}

config() {
  path=$1
  link "$repo_dir/.config/$path" "$config_home/$path"
}

# Config files
link "$repo_dir/.config/zsh/.zshenv" "$HOME/.zshenv"
config "zsh/.zshrc"
config "git/config"
config "aerospace/aerospace.toml"
config "ghostty/config"
config "herdr/config.toml"
config "mise/config.toml"
config "tmux/tmux.conf"

# Editors
config "zed/settings.json"
config "zed/keymap.json"

# Scripts
for script in "$repo_dir"/bin/*; do
  [ -f "$script" ] || continue
  link "$script" "$HOME/.local/bin/$(basename "$script")"
done
