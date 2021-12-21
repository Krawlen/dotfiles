#!/usr/bin/env bash

# Ask for the administrator password upfront.
# Make sure XCode is up to date!!!
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#
# Check if Homebrew is installed
#
which -s brew
if [[ $? != 0 ]] ; then
  # Install Homebrew
  # http://brew.sh/
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

brew upgrade

### INSTALL CASKS
brew cask install google-chrome
brew cask install atom
brew cask install contexts
brew cask install iterm2
brew cask install sourcetree
brew cask install spotify
brew cask install vlc
brew cask install libreoffice
brew cask install bettertouchtool
brew cask install sequel-pro
brew cask install whatsapp
brew cask install messenger
brew cask install google-hangouts
brew cask install slack
brew cask install android-studio
brew cask install charles
brew cask install postman
