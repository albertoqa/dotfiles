#!/usr/bin/env bash

# macOS.sh
# Script to set up a new mac with my preferred configurations.
#
# Original code and idea from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General                                                                     #
###############################################################################

# Use dark menu bar and dock
#TODO

# Set sidebar icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

###############################################################################
# Desktop & Screen Saver                                                      #
###############################################################################

# Change screensaver to random
# TODO

# Start screensaver after 10 minutes
# TODO

# Show screensaver with Clock
# TODO

# Set custom wallpaper ¡Carefull custom command!
# TODO

###############################################################################
# Dock                                                                        #
###############################################################################

# Set the icon size of Dock items to 34 pixels
defaults write com.apple.dock tilesize -int 34

# Change minimize/maximize window effect to Scale effect
defaults write com.apple.dock mineffect -string "scale"

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Change dock position on the screen to left
defaults write com.apple.dock orientation -string left

# Turn off magnification
defaults write com.apple.dock magnification -boolean NO

# Double-click a window's title bar to minimize
# TODO

# Prefer tabs when opening documents always
# TODO

###############################################################################
# Mission Control                                                             #
###############################################################################

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Don’t group windows by application in Mission Control
defaults write com.apple.dock expose-group-by-app -bool false

# Disable Dashboard - disabled by default
# defaults write com.apple.dashboard mcx-disabled -bool true

# Hot Corners... Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0

###############################################################################
# Language & Region                                                           #
###############################################################################

# I'm a spanish speaker but using English language for the mac. I just want to
# add the Spanish language as a secondary language to the system. This is a
# little remmember.
echo "Remmember to add Spanish language to the list."

###############################################################################
# Security & Privacy                                                          #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Turn on firewall
defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Allow apps downloaded from App Store and identified developers
# TODO

###############################################################################
# Spotlight                                                                   #
###############################################################################

# Don't search for fonts
# TODO

###############################################################################
# Displays                      	                                            #
###############################################################################

# Don't show mirroring options in menu bar
defaults write com.apple.airplay showInMenuBarIfPresent -bool false

# Change resolution to 1440x900
# TODO

###############################################################################
# Energy Saver                  	                                            #
###############################################################################

# Show Battery Percentage on the meny bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Battery - Turn display off after: 5 min
# TODO

# Power Adapter - Turn display off after: 12 min
# TODO

###############################################################################
# Keyboard                       	                                            #
###############################################################################

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Don't adjust keyboard brightness on low light
# defaults write com.apple.BezelServices kDim -bool true
# TODO check

# Turn keyboard backlight off after 30 secs of inactivity
# defaults write com.apple.BezelServices kDimTime -int 30
# TODO check

# Disable auto-correct spelling automatically
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 3
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

###############################################################################
# Trackpad                       	                                            #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Activate App Exposé gesture
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

###############################################################################
# Printers                       	                                            #
###############################################################################

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

###############################################################################
# Sound                         	                                            #
###############################################################################

# Show volume in menu bar
defaults write com.apple.systemuiserver menuExtras -array \
	"/System/Library/CoreServices/Menu Extras/Volume.menu" \
	"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
	"/System/Library/CoreServices/Menu Extras/Battery.menu" \
	"/System/Library/CoreServices/Menu Extras/Clock.menu"

###############################################################################
# iCloud                         	                                            #
###############################################################################

# TODO

###############################################################################
# Internet Accounts              	                                            #
###############################################################################

# TODO check if is possible to automaically add my internet accounts in a
# separate file so it is private

###############################################################################
# App Store                      	                                            #
###############################################################################

# Save password for free downloads
# TODO

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

###############################################################################
# Bluethooth                     	                                            #
###############################################################################

# Turn bluethooth off
# TODO

###############################################################################
# Extensions                    	                                            #
###############################################################################

# TODO any extension worth installing?

###############################################################################
# Users & Groups                	                                            #
###############################################################################

# Don't allow guests to log in to this computer
defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO
defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO

# Change user photo 😎
# TODO

###############################################################################
# Siri                           	                                            #
###############################################################################

# Disable Siri
# TODO

###############################################################################
# Date & Time                   	                                            #
###############################################################################

# Set date and time automatically
# TODO

# Show date on the menu bar
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm"

###############################################################################
# Time Machine                   	                                            #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Don't show Time Machine in menu bar
# TODO

###############################################################################
# Accesibility                  	                                            #
###############################################################################

# Enable trackpad dragging without lock
# TODO

###############################################################################
# Extras                        	                                            #
###############################################################################

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
chflags nohidden /Volumes

# Create Developer folder in home directory
# TODO check if exists
# mkdir ~/Developer

###############################################################################
# Desktop                        	                                            #
###############################################################################

# Show item info to the right of the icons on the desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

# Set desktop icons size to 20x20
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 20" ~/Library/Preferences/com.apple.finder.plist

# Set grid spacing for desktop icons to 50
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 50" ~/Library/Preferences/com.apple.finder.plist

###############################################################################
# Finder                         	                                            #
###############################################################################

# Set User home as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Don't show tags on the sidebar
# TODO

# Don't show "All my files" and "Recent tags" on the sidebar
# TODO

# Show "User" and "User Macbook Pro" on the sidebar
# TODO

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

###############################################################################
# Mail                          	                                            #
###############################################################################


###############################################################################
# Safari                         	                                            #
###############################################################################


###############################################################################
# Calendar                      	                                            #
###############################################################################

# Don't show birthdays Calendar
# TODO

# Show week numbers
# TODO

# Make text smaller (twice)
# TODO

###############################################################################
# Contacts                       	                                            #
###############################################################################

# Sort by first name
# TODO
