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
defaults write ~/Library/Preferences/.GlobalPreferences.plist AppleInterfaceTheme -string "Dark"
defaults write ~/Library/Preferences/.GlobalPreferences.plist AppleInterfaceStyle -string "Dark"

# Set sidebar icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

###############################################################################
# Desktop & Screen Saver                                                      #
###############################################################################

# Change screensaver to random
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Random path /System/Library/Screen\ Savers/Random.saver type 8

# Start screensaver after 10 minutes
defaults -currentHost write com.apple.screensaver idleTime 600

# Show screensaver with Clock
defaults -currentHost write com.apple.screensaver showClock -bool true

# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
#rm -rf ~/Library/Application Support/Dock/desktoppicture.db
#sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
#sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg

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
defaults write ~/Library/Preferences/.GlobalPreferences.plist AppleActionOnDoubleClick -string "Minimize"

# Prefer tabs when opening documents always
defaults write ~/Library/Preferences/.GlobalPreferences.plist AppleWindowTabbingMode -string "always"

# remove all icons from the dock
defaults write com.apple.dock persistent-apps -array

# add my preferred icons to the dock
dockutil --add '/Applications/Safari.app' --replacing 'Safari'
dockutil --add '/Applications/Mail.app' --replacing 'Mail'
dockutil --add '/Applications/Calendar.app' --replacing 'Calendar'
dockutil --add '/Applications/Notes.app' --replacing 'Notes'
dockutil --add '/Applications/Utilities/Terminal.app' --replacing 'Terminal'

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

# System language set to English, region set to ES
defaults write ~/Library/Preferences/.GlobalPreferences.plist AppleLocale -string "en_ES"

# Add spanish to the list of system languages
defaults write ~/Library/Preferences/.GlobalPreferences.plist AppleLanguages -dict "en-ES" "es-ES"

# Select default metrics
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"

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

# Change default spotlight categories
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}' \
	'{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 1;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 1;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "MESSAGES";}' \
	'{"enabled" = 1;"name" = "CONTACT";}' \
	'{"enabled" = 1;"name" = "EVENT_TODO";}' \
	'{"enabled" = 1;"name" = "IMAGES";}' \
	'{"enabled" = 1;"name" = "BOOKMARKS";}' \
	'{"enabled" = 1;"name" = "MUSIC";}' \
	'{"enabled" = 1;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "FONTS";}' \
	'{"enabled" = 1;"name" = "MENU_OTHER";}' \
	'{"enabled" = 1;"name" = "SOURCE";}'

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

# Battery - Computer sleep: 20 min
sudo pmset -b sleep 20

# Battery - Turn display off after: 5 min
sudo pmset -b displaysleep 5

# Power Adapter - Computer sleep: 30 min
sudo pmset -c sleep 30

# Power Adapter - Turn display off after: 12 min
sudo pmset -c displaysleep 12

###############################################################################
# Keyboard                       	                                            #
###############################################################################

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Don't adjust keyboard brightness on low light
defaults write com.apple.BezelServices kDim -bool true

# Turn keyboard backlight off after 30 secs of inactivity
defaults write com.apple.BezelServices kDimTime -int 30

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

# enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# activate App Exposé gesture
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

defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -bool true

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

# Show date on the menu bar
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm"

###############################################################################
# Time Machine                   	                                            #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

###############################################################################
# Accesibility                  	                                            #
###############################################################################

# Enable trackpad dragging without lock
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -int 1
defaults write com.apple.AppleMultitouchTrackpad Dragging -int 1

###############################################################################
# Extras                        	                                            #
###############################################################################

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
chflags nohidden /Volumes

# Create Developer folder in home directory
if [ ! -d ~/Developer ]; then
	mkdir ~/Developer
fi;

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
defaults write com.apple.finder NewWindowTarget -string "PfHm"
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
# TODO "all my files"
defaults write com.apple.finder ShowRecentTags -bool false

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

# Enable junk mail filtering
# TODO

# Show To/Cc label in the message list
# TODO

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

# Disable inline attachments (just show the icons)
# defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# TODO add signature to gmail
# TODO select gmail as primary address

###############################################################################
# Safari                         	                                            #
###############################################################################

# show the status bar at the bottom (see URL on hover)
defaults write com.apple.Safari 'ShowStatusBar' -bool true

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to google.com
defaults write com.apple.Safari HomePage -string "https://www.google.com"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Show Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool true

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Open new tabs with an empty page
defaults write com.apple.Safari NewTabBehavior -int 1

# don't show favorites on the smart search bar
defaults write com.apple.Safari ShowFavoritesUnderSmartSearchField -bool false

# don't allow websites to ask for permission to send push notifications
defaults write com.apple.Safari CanPromptForPushNotifications -bool false

# TODO install extensions: "Save to Pocket", "AdBlock", "SessionRestore"

###############################################################################
# Calendar                      	                                            #
###############################################################################

# Don't show birthdays Calendar
defaults write com.apple.iCal "display birthdays calendar" -bool false

# Show week numbers
defaults write com.apple.iCal "Show Week Numbers" -bool true

# Make text smaller
defaults write com.apple.iCal "CalUICanvasOccurrenceFontSize" -int 10

###############################################################################
# Contacts                       	                                            #
###############################################################################

# Address format
defaults write com.apple.AddressBook ABDefaultAddressCountryCode -string "es"

# Display format "First, Last"
defaults write com.apple.AddressBook NSPersonNameDefaultDisplayNameOrder -int 1

# Sort by first name
defaults write com.apple.AddressBook ABNameSortingFormat -string "sortingFirstName sortingLastName"

###############################################################################
# Terminal                       	                                            #
###############################################################################

# TODO

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

###############################################################################

echo "Done. Note that some of these changes require a logout/restart to take effect."

# Restart computer now!
shutdown -r now
