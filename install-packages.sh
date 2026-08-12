echo "Installing brew packages..."

brew install mise
brew install zsh-autosuggestions
brew install zsh-fast-syntax-highlighting

brew install tmux
brew install tpm
brew install herdr
brew install starship
brew install bat
brew install fzf
brew install eza
brew install ripgrep
brew install zoxide
brew install fastfetch
brew install gh
brew install btop
brew install modem-dev/tap/hunk

brew install zed
brew install ghostty
brew install raycast
brew install --cask nikitabobko/tap/aerospace
brew install homerow
brew install helium-browser

brew install font-jetbrains-mono-nerd-font
brew install font-iosevka

echo "Installing mise-managed tools..."

mise install

echo "Installing gh extensions..."

gh extension install dlvhdr/gh-dash
