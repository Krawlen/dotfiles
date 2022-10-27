#!/usr/bin/env bash
#
# bootstrap installs things.
# DO NOT source bootstrap.sh, it is only necessary to call ./bootstrap.sh
# Make sure to run in the same folder as the bootstrap.sh

# Usage: ./bootstrap.sh 
# Auto overwrite files: ./bootstrap.sh true

DOTFILES_ROOT=$( cd "$( dirname "$0" )" && pwd )/symlinks

source ./scripts/link_files.sh
source ./scripts/utils.sh
source ./scripts/install_libs.sh

set -e

echo ''


#setup_gitconfig
install_dependencies
ruby ./scripts/install_dotfiles.rb $DOTFILES_ROOT $1




echo ''
echo '  All installed!'
