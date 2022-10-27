Inspired in: https://github.com/holman/dotfiles/blob/master/script/bootstrap


# Usage

Note: Make sure to clone this repo and all the submodules
```
git submodule update --init --recursive
```
OR
```
git clone --recursive -j8 git@github.com:Krawlen/dotfiles.git
```

1. Install brew packages
2. Install NeoVim ( Note: Installing RVM, nodenv, pyenv may require logout)
2. Install all OS specific apps/libs ( See files under ./os/)
3. Run `./bootstrap.sh`


## Common Errors
1. NeoVim errors with coc. -> cd ~/.vim/bundle/coc.nvim and change branch to release
2. antigen not loading plugins correctly -> Change order of zshrc to move source zshrc-common to the end


