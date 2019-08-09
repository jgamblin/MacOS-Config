#!/bin/bash

#Check If Brew Is Installed
if ! [ -x "$(command -v brew)" ]; then
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   else
     brew update
     brew upgrade
   fi
   
# Install Need Software on Mac #
#brew cask install evernote
brew cask install firefox
#brew cask install visual-studio-code
#brew cask install google-chrome
#brew cask install peakhour
brew cask install dropbox
brew cask install telegram
#brew cask install 1password
brew cask install iterm2
#brew cask install vmware-fusion
#brew cask install ipvanish-vpn
brew cask install insomniax
brew tap buo/cask-upgrade
