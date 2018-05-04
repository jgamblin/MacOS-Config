#!/bin/bash

mkdir Desktop/files
cd Desktop/files


#### Download Evernote ####
printf "Downloading Evernote ...\n"
curl -s -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.117 Safari/537.36" -L "https://evernote.com/download/" | sed -n 's/^.*\(https.*dmg\).*/\1/p' > evernote.txt && curl $(cat evernote.txt) -O && cat evernote.txt | sed 's@.*/@@' > File.txt > /dev/null 2>&1
File=$(cat File.txt)
VOLUME=`hdiutil attach "$File" | grep Volumes | awk '{print $3}'`

printf "Installing FireFox ...\n"
cp -rf $VOLUME/*.app /Applications
rm File.txt && rm "$File"
hdiutil detach $VOLUME > /dev/null 2>&1
printf "Evernote Success Installed.\n"
#############################

###### Download FireFox #######
printf "Downloading FireFox ...\n"
wget --content-disposition "https://download.mozilla.org/?product=firefox-latest-ssl&os=osx&lang=en-US" > /dev/null 2>&1 && ls Firefox* > File.txt
File=$(cat File.txt)
VOLUME=`hdiutil attach "$File" | grep Volumes | awk '{print $3}'`

printf "Installing FireFox ...\n"
cp -rf $VOLUME/*.app /Applications
rm File.txt && rm "$File"
hdiutil detach $VOLUME > /dev/null 2>&1
printf "FireFox Success Installed.\n"
##############################

###### Download VisualStudio Code #######
printf "Downloading VSCode ...\n"
wget --content-disposition "https://az764295.vo.msecnd.net/stable/3aeede733d9a3098f7b4bdc1f66b63b0f48c1ef9/VSCode-darwin-stable.zip" > /dev/null 2>&1 && unzip VSCode-darwin-stable.zip > /dev/null 2>&1 && echo "Visual Studio Code.app" > File.txt
File=$(cat File.txt)
VOLUME=`hdiutil attach "$File" | grep Volumes | awk '{print $3}'`

printf "Installing VSCode ...\n"
cp -rf $VOLUME/*.app /Applications
rm *.zip && rm -rf "$File" && rm File.txt
hdiutil detach $VOLUME > /dev/null 2>&1
printf "VSCode Success Installed.\n"
##############################

###### Download Google Chrome #######
printf "Downloading Google Chrome ...\n"
wget --content-disposition "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg" > /dev/null 2>&1 && echo "$(ls googlechrome*)" > File.txt
File=$(cat File.txt)
VOLUME=`hdiutil attach "$File" | grep Volumes | awk '{print $3}'`

printf "Installing Google Chrome ...\n"
cp -rf $VOLUME/*.app /Applications
rm "$File" && rm File.txt
hdiutil detach $VOLUME > /dev/null 2>&1
printf "Google Chrome Success Installed.\n"
##############################


###### Download PeakHour 4.0 Chrome #######
printf "Downloading PeakHour 4.0 Chrome ...\n"
wget --content-disposition "https://updates.peakhourapp.com/releases/PeakHour%204.dmg" > /dev/null 2>&1 && echo "$(PeakHour*)" > File.txt
File=$(cat File.txt)
VOLUME=`hdiutil attach "$File" | grep Volumes | awk '{print $3}'`

printf "Installing PeakHour 4.0 ...\n"
cp -rf $VOLUME/*.app /Applications
rm "$File" && rm File.txt
hdiutil detach $VOLUME > /dev/null 2>&1
printf "PeakHour 4.0 Success Installed.\n"
##############################


###### Download Dropbox #######
printf "Downloading Dropbox ...\n"
wget --content-disposition "https://www.dropbox.com/download?plat=mac&type=full" > /dev/null 2>&1 && echo "$(ls Dropbox*)" > File.txt
File=$(cat File.txt)
VOLUME=`hdiutil attach "$File" | grep Volumes | awk '{print $3}'`

printf "Installing Dropbox ...\n"
cp -rf $VOLUME/*.app /Applications
rm "$File" && rm File.txt
hdiutil detach $VOLUME > /dev/null 2>&1
printf "Dropbox Success Installed.\n"
##############################
