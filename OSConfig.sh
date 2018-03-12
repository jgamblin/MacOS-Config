#!/bin/bash

# Turn On Dark Mode (From brew install dark-mode)
dark-mode on

# Save To Disk (not to iCloud) By Default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically Quit Printer App Once The Print Jobs Complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable The “Are You Sure You Want To Open This Application?” Dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Remove duplicates In The “Open With” Menu.
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

#Remove Icons For Hard Drives, Servers, And Removable Media On The Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
killall -HUP Finder


#Keep folders At Top When Sorting By Name.
defaults write com.apple.finder _FXSortFoldersFirst -bool true

#Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#Show the ~/Library and /Voluemes folder
chflags nohidden ~/Library
sudo chflags nohidden /Volumes

#Download and Install available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

#Finder: Show Hidden Files By Default
#defaults write com.apple.finder AppleShowAllFiles -bool true

#Avoid Creating .DS_Store Files On Network Or USB Volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Automatically Open A New Finder Window When A Volume Is Mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Minimize Windows Into Their Application’s Icon
defaults write com.apple.dock minimize-to-application -bool true

# setup Oh my Zsh & Plugins & Themes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/plugins/zsh-syntax-highlighting
curl -o $ZSH/themes/cobalt2.zsh-theme https://raw.githubusercontent.com/wesbos/Cobalt2-iterm/master/cobalt2.zsh-theme

# Edit Oh My Zsh configure file
sed -i 's/\(^ZSH_THEME=\).*/\ZSH_THEME="cobalt2"/' ~/.zshrc
sed -i '/git/s/ .*/ git zsh-syntax-highlighting zsh-autosuggestions/' ~/.zshrc
chsh -s /bin/zsh

# Install Powerline Fonts 
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Allow Apps from Anywhere
sudo spctl --master-disable

# Auto change wallpaper after login On Mac
mkdir ~/Pictures/Wallpapers/ && mkdir ~/Pictures/Wallpapers/unsplash
curl -o ~/Pictures/Wallpapers/unsplash/login.sh  "https://raw.githubusercontent.com/Mehran/MacOS-Config/master/UnsplashBackground.sh" && chmod +x ~/Pictures/Wallpapers/unsplash/login.sh
curl -o ~/Library/LaunchAgents/com.user.loginscript.plist "https://gist.githubusercontent.com/Mehran/86019097a00dc661d2ca5c5820a2bfd1/raw/e399e122f121ed9a4f8d08154efe49ccd617d329/com.user.loginscript"
launchctl load ~/Library/LaunchAgents/com.user.loginscript.plist
