#!/usr/bin/env bash
#
# bootstrap installs things.
# DO NOT source bootstrap.sh, it is only necessary to call ./bootstrap.sh
# 

if [ -z "$1" ]; then
  DOTFILES_ROOT=$( cd "$( dirname "$0" )" && pwd )/symlinks
elif [ -d "$1" ]; then
  DOTFILES_ROOT="$1"
else
  echo "Not a valid directory"
fi

source ./scripts/link_files.sh
source ./scripts/utils.sh
source ./scripts/install_libs.sh

set -e

echo ''


setup_gitconfig
install_dependencies
install_dotfiles




echo ''
echo '  All installed!'
