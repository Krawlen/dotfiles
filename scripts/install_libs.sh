
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

}

# If we're on a Mac, let's install and setup homebrew.
# if [ "$(uname -s)" == "Darwin" ]
# then
#   info "installing dependencies"
#   if source bin/dot > /tmp/dotfiles-dot 2>&1
#   then
#     success "dependencies installed"
#   else
#     fail "error installing dependencies"
#   fi
# fi