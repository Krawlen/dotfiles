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

# MYSQL
# brew install mysql
brew install mysql
# Python
brew install python
# Python3
brew install python3
# ImageMagick
brew install imagemagick
# Macvim
brew install macvim --with-override-system-vim
# Tmux
brew install tmux
# reattach-to-user-namespace
brew install reattach-to-user-namespace
# ack
brew install ack
# git
brew install git
# git flow
brew install git-flow
# Redis
brew install redis
# zsh
brew install zsh
# AG
brew install the_silver_searcher
# Notify when a process completes
brew install noti
# Install Node
brew install npm
# Install JS Plugins!
npm install -g tern
npm install -g jslint
npm install -g jshint

#Install qt
brew install qt
# Install Command-line Fuzzy Finder
brew install fzf
# Add key fzf keybindings
/usr/local/opt/fzf/install
# htop - Monitoring tool
brew install htop
# Vim replacement
brew install neovim/neovim/neovim
# Install neovim python 3 plugin
pip3 install neovim
#web proxy -----****
#brew install mitmproxy


### INSTALL CASKS
brew cask install google-chrome
brew cask install atom
brew cask install contexts
brew cask install iterm2
brew cask install sourcetree
brew cask install spotify
brew cask install vlc
brew cask install libreoffice
brew cask install wmail
brew cask install bettertouchtool
brew cask install sequel-pro
brew cask install whatsapp
brew cask install messenger
brew cask install google-hangouts
brew cask install slack
brew cask install android-studio
brew cask install charles
brew cask install postman


# Set zsh as the default interpreter
if [ -z "$(grep '/usr/local/bin/zsh' /etc/shells)" ];then
 echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
fi
chsh -s /usr/local/bin/zsh

# Remove outdated versions from the cellar.
