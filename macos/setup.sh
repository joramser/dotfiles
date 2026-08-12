#!/usr/bin/env sh
set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

## Screenshots folder
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location "$HOME/Screenshots"

## Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock expose-group-apps -bool true
defaults delete com.apple.dock persistent-apps 2>/dev/null || true

## Desktop
defaults write com.apple.WindowManager StandardHideWidgets -bool true
defaults write com.apple.WindowManager StageManagerHideWidgets -bool true

## Finder
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder SidebarTagsSctionDisclosedState -bool false
defaults write com.apple.finder FinderSpawnTab -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

## Hotkeys
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 64 "{enabled = 0;}" # Disable Spotlight

## Keyboard — remap Caps Lock to Control (persistent via LaunchAgent)
launch_agent_dir="$HOME/Library/LaunchAgents"
launch_agent_path="$launch_agent_dir/com.local.KeyRemapping.plist"

mkdir -p "$launch_agent_dir"
launchctl bootout "gui/$(id -u)" "$launch_agent_path" >/dev/null 2>&1 || true
cp "$DOTFILES_DIR/LaunchAgents/com.local.KeyRemapping.plist" "$launch_agent_path"
launchctl bootstrap "gui/$(id -u)" "$launch_agent_path"

## Trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0

## Control Center
defaults write com.apple.controlcenter.plist BatteryShowPercentage -bool true
defaults write com.apple.Spotlight "NSStatusItem VisibleCC Item-0" -bool false

## Per-host settings
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -bool true
defaults -currentHost write com.apple.controlcenter Bluetooth -int 18
defaults -currentHost write com.apple.controlcenter Weather -int 2

for process in SystemUIServer Dock Finder ControlCenter Safari; do
  killall "$process" 2>/dev/null || true
done
