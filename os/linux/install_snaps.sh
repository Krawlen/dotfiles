# Ask for the administrator password upfront.
# Make sure XCode is up to date!!!
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


snap install 1password
snap install spotify
snap install slack --classic
snap install vlc
snap install beekeeper-studio
snap install code --classic
snap install gitkraken --classic
snap install postman
snap install teams
# snap install libreoffice Usually comes already installed
