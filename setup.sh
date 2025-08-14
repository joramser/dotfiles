# Script to setup a new machine

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing dotfiles..."
mkdir -p ~/Projects/jorge/dotfiles
git clone https://github.com/joramser/dotfiles.git ~/Projects/jorge/dotfiles

echo "Installing Homebrew packages..."
sh ~/Projects/jorge/dotfiles/brew/install-packages.sh

echo "Installing VSCode extensions..."
sh ~/Projects/jorge/dotfiles/vscode/install-extensions.sh

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

echo "Linking dotfiles"
cd ~/Projects/jorge/dotfiles
sh links.sh
git remote set-url origin git@github.com:joramser/dotfiles.git
cd $HOME

echo "Configuring macOS settings..."
sh ~/Projects/jorge/dotfiles/macos.sh
