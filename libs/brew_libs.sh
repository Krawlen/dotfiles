#!/usr/bin/env bash

# Ask for the administrator password upfront.
# Make sure XCode is up to date!!!
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#
# Check if Homebrew is installed
#
which brew
if [[ $? != 0 ]] ; then
  # Install Homebrew
  # http://brew.sh/
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  brew update
fi

brew upgrade

# MYSQL
# brew install mysql
brew install mysql
# ImageMagick
brew install imagemagick
# Tmux
brew install tmux
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
# Install Ctag -> Used in nvim
brew install ctags
#Install qt
brew install qt
# Install Command-line Fuzzy Finder
brew install fzf
# Add key fzf keybindings
/usr/local/opt/fzf/install
# htop - Monitoring tool
brew install htop
brew install yarn

# Install kubectl
brew install kubectl
brew install kubectx

# Install tfenv
brew install tfenv
# Install Azure CLI
brew install azure-cli
# Install AWS CLI
brew install awscli
# Install stern to search kubernetes logs
brew install stern
# Instal Helm
brew install helm

#web proxy -----****
#brew install mitmproxy

zshPath=$(which zsh)
# Set zsh as the default interpreter
if [ -z "$(grep '$zshPath' /etc/shells)" ];then
 echo "$zshPath" | sudo tee -a /etc/shells
fi
chsh -s $zshPath

