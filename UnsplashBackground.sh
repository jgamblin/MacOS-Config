#!/bin/bash
mkdir -p ~/Pictures/Wallpapers/unsplash
rm -f ~/Pictures/Wallpapers/unsplash/"$(date +%F)".png
curl -s -L -o ~/Pictures/Wallpapers/unsplash/"$(date +%F)".png "https://unsplash.it/2560/1600/?random"  > /dev/null
osascript -e "tell application \"System Events\" to set picture of every desktop to \"~/Pictures/Wallpapers/unsplash/$(date +%F).png\""
killall Dock
