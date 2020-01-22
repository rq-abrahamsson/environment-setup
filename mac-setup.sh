#!/bin/sh

#Install hombrew
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#brew update
sudo chown -R $USER /usr/local/*


#brew install git
#brew install hub
#brew intsall aspell
brew install neovim
 brew install curl --with-nghttp2
# brew install pyenv
 brew link curl --force
#brew cask install google-chrome
brew cask install telegram

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# check for updates daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# sets clock to 24-hour mode
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

# disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# disable .DS_Store on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "NO"

# set tap-to-click
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1

# Faster key repeat
defaults write NSGlobalDomain KeyRepeat -int 1

###################
### setup ZSH and oh-my-zsh
###################

brew install zsh zsh-completions

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#Change shell and you should log in and out after this...
chsh -s /usr/local/bin/zsh

ln -s .zshrc ~
cp .zshenv ~


####################
### setup hub
####################
#eval "$(hub alias -s)"

####################
### setup spacemacs
####################
#brew tap d12frosted/emacs-plus
#brew install emacs-plus --with-cocoa --with-gnutls --with-librsvg --with-imagemagick --with-spacemacs-icon
#brew linkapps
#sudo rm /usr/bin/emacs
#sudo rm -rf /usr/share/emacs

#git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
### should remove
#####ln -s .spacemacs-template ~/.spacemacs


###################
### setup Python
###################

# For switching python version use chpy
#https://github.com/mahnve/chpy

#brew install python
#pip install --upgrade setuptools
#pip install --upgrade pip
#pip install virtualenv

###################
### setup iTerm2
###################
#Install iterm2 according to instructions on its homepage....
brew cask install iterm2
rm ~/Library/Caches/com.googlecode.iterm2.plist
cp com.googlecode.iterm12.plist ~/Library/Preferences/
defaults read com.googlecode.iterm2
brew cask install spectacle

##################
### setup Android
##################

#brew install node
#brew install watchman
#npm install -g react-native-cli
#brew cask install java
#brew install android-sdk
