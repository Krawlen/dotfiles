# Install Ruby
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
export PATH="$PATH:$HOME/.rvm/bin"
rvm install 3.0
rvm use default 3.0
gem install neovim


# NODE -----------------
brew install nodenv
echo 'eval "$(nodenv init -)"' >> ~/.zshrc
eval "$(nodenv init -)"
nodenv install 17.3.0
nodenv global 17.3.0
# Install neovim node plugin
npm install -g neovim



# Manage python envs
brew install pyenv
# Install python Neovim
pyenv install 3.10-dev
pyenv global 3.10-dev
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
eval "$(pyenv init -)"
python -m pip install --upgrade pip
# Vim replacement
brew install neovim/neovim/neovim
brew install vim

