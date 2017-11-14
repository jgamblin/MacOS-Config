#!/bin/bash

#Check If Brew Is Installed
if ! [ -x "$(command -v brew)" ]; then
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   else
     brew update
     brew upgrade
   fi

# Install Core Utilities (Most Of MacOS Defaults Are Outdated).
brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names
brew install grep
brew install openssh
brew install screen
brew install p7zip
brew install ssh-copy-id
brew install tree
brew install bash
brew install bash-completion2
brew install git
brew install git-lfs

# Install Some Security Tools
brew install binutils
brew install binwalk
brew install nmap
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace

# Install Some Other Tools
brew install shellcheck
brew install dark-mode


# Clean Up Brew
brew cleanup
