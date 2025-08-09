# Configure macOS settings

## Screenshots folder
mkdir ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots

## Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock expose-group-apps -bool true
defaults delete com.apple.dock persistent-apps;

## Finder
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder FinderSpawnTab -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

## Hotkeys
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 64 "{enabled = 0;}" # Disable Spotlight

## Trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -bool true

## Control Center
defaults write com.apple.controlcenter.plist BatteryShowPercentage -bool true

# Safari
defaults write com.apple.Safari WebKitDeveloperExtras -bool true

killall SystemUIServer
killall Dock
killall Finder
killall ControlCenter
killall Safari
