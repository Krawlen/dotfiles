# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


add-apt-repository -y ppa:appimagelauncher-team/stable
apt-get update
apt install -y appimagelauncher

# snap install 1password Install manually because when it is sandboxed it cannot communicate with browser
snap install spotify
snap install slack --classic
snap install vlc
#snap install beekeeper-studio --classic # Install AppImage instead as the snap is not allowed to connect using SSH ( security)
snap install code --classic
snap install gitkraken --classic
snap install postman
snap install teams
# snap install libreoffice Usually comes already installed
