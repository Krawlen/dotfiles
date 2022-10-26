#!/usr/bin/env bash

# Library to read Json
brew install jq
# MYSQL
brew install ack
# git
brew install git
# git flow
brew install git-flow
# zsh
brew install zsh
# AG
brew install the_silver_searcher
# Install Command-line Fuzzy Finder
brew install fzf
# Add key fzf keybindings
$(brew --prefix)/opt/fzf/install
# htop - Monitoring tool
brew install htop

# Install kubectl
brew install kubectl
brew install kubectx

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

