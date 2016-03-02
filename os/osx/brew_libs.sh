#!/usr/bin/env bash

# Ask for the administrator password upfront.
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
# brew install mysql # Cant use mysql 5.7
brew install mysql55
# Python
brew install python
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
#Install qt
brew install qt

# Set zsh as the default interpreter
if [ -z "$(grep '/usr/local/bin/zsh' /etc/shells)" ];then
  echo "/usr/local/bin/zsh" >> "/etc/shells"
fi
chsh -s /usr/local/bin/zsh

# Remove outdated versions from the cellar.
brew cleanup
