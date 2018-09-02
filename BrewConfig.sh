#!/bin/bash

#Check If Brew Is Installed
if ! [ -x "$(command -v brew)" ]; then
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   else
     brew update
     brew upgrade
   fi

# Install My Tools
brew install ack
brew install aircrack-ng
brew install bash
brew install bash-completion2
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install coreutils
brew install dark-mode
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install findutils
brew install foremost
brew install git
brew install git-lfs
brew install gnu-sed --with-default-names
brew install grep
brew install hashpump
brew install hydra
brew install imagemagick --with-webp
brew install john
brew install knock
brew install lua
brew install lynx
brew install netpbm
brew install nmap
brew install openssh
brew install p7zip
brew install pigz
brew install pngcheck
brew install pv
brew install rename
brew install rlwrap
brew install screen
brew install shellcheck
brew install socat
brew install sqlmap
brew install ssh-copy-id
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install tree
brew install ucspi-tcp
brew install vbindiff
brew install vim --with-override-system-vi
brew install wget --with-iri
brew install xpdf
brew install xz
brew install zopfli

# Clean Up Brew
brew cleanup
