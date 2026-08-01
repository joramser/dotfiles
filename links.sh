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

# Config files
link "$repo_dir/zsh/.zshrc" "$HOME/.zshrc"
link "$repo_dir/git/.gitconfig" "$HOME/.gitconfig"
link "$repo_dir/.config/aerospace/aerospace.toml" "$config_home/aerospace/aerospace.toml"
link "$repo_dir/.config/ghostty/config" "$config_home/ghostty/config"
link "$repo_dir/.config/herdr/config.toml" "$config_home/herdr/config.toml"
link "$repo_dir/.config/mise/config.toml" "$config_home/mise/config.toml"
link "$repo_dir/.config/tmux/tmux.conf" "$config_home/tmux/tmux.conf"

# Editors
link "$repo_dir/.config/zed/settings.json" "$config_home/zed/settings.json"
link "$repo_dir/.config/zed/keymap.json" "$config_home/zed/keymap.json"

# Scripts
for script in "$repo_dir"/bin/*; do
  [ -f "$script" ] || continue
  link "$script" "$HOME/bin/$(basename "$script")"
done
