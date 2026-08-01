#!/usr/bin/env sh
set -eu

repo_dir=$(cd "$(dirname "$0")" && pwd)

if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

echo "Linking dotfiles"
"$repo_dir/links.sh"
git -C "$repo_dir" remote set-url origin git@github.com:joramser/dotfiles.git

echo "Installing packages..."
sh "$repo_dir/install-packages.sh"

echo "Generating SSH keys for github.com..."
ssh-keygen -t ed25519 -C "jramirezserrato@gmail.com"
touch ~/.ssh/config
echo "Host github.com" >> ~/.ssh/config
echo "  AddKeysToAgent yes" >> ~/.ssh/config
echo "  UseKeychain yes" >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
gh auth login
git clone ssh://git@github.com/joramser/website.git ~/Projects/jorge/website

echo "Configuring macOS settings..."
sh "$repo_dir/macos/setup.sh"
