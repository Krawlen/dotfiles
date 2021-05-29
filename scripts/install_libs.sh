
#Manually install the dependencies
install_dependencies(){
  info 'Installing dependencies'
  local overwrite_all=false backup_all=false skip_all=false
  #Antigen
  mkdir -p "$HOME/.vim/bundle/"
  link_file "$(pwd)/libs/antigen" "$HOME/.antigen"
  # Vundle
  mkdir -p "$HOME/.vim/bundle/"
  link_file "$(pwd)/libs/Vundle.vim" "$HOME/.vim/bundle/Vundle.vim"


  if [ ! -f /usr/local/bin/kubectx ]; then
    sudo ln -s "$(pwd)/libs/kubectx/kubectx" "/usr/local/bin/kubectx"
  fi

  if [ ! -f /usr/local/bin/kubens ]; then
    sudo ln -s "$(pwd)/libs/kubectx/kubens" "/usr/local/bin/kubens"
  fi

  # mkdir -p ~/.oh-my-zsh/completions
  # chmod -R 755 ~/.oh-my-zsh/completions
  #link_file "$(pwd)/libs/kubectx/completion/kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
  #link_file "$(pwd)/libs/kubectx/completion/kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh
  if [ ! -f /usr/share/zsh/functions/Completion/kubectx.zsh ]; then
    sudo ln -s "$(pwd)/libs/kubectx/completion/kubectx.zsh" /usr/share/zsh/functions/Completion/_kubectx.zsh
  fi

  if [ ! -f /usr/share/zsh/functions/Completion/kubens.zsh ]; then
    sudo ln -s "$(pwd)/libs/kubectx/completion/kubens.zsh" /usr/share/zsh/functions/Completion/_kubens.zsh
  fi


  # If we're on a Mac, let's install and setup homebrew.
  #if [ "$(uname -s)" == "Darwin" ]
  #  then
    #source "$(pwd)/os/osx/brew_libs.sh"
 # fi

  info "Installing fonts"
  $(pwd)/libs/fonts/install.sh
}

