#!/bin/bash

cat <<-'EOT'
 _   _                      _
| | | | ___  _ __ ___   ___| |__  _ __ _____      __
| |_| |/ _ \| '_ ` _ \ / _ \ '_ \| '__/ _ \ \ /\ / /
|  _  | (_) | | | | | |  __/ |_) | | |  __/\ V  V /
|_| |_|\___/|_| |_| |_|\___|_.__/|_|  \___| \_/\_/

EOT

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Keep-alive: update existing `sudo` time stamp until
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Brew Update
brew update

# shell
brew install fish
brew install tmux
brew install reattach-to-user-namespace
brew install fzf
brew install z
brew install figlet
brew install tree
brew install htop
brew install highlight

brew install curl
brew install wget

# editors
brew install vim --with-lua

# version control
brew install git
brew install tig

# media
brew install pngquant
brew install imagemagick
brew install ffmpeg

# dev
brew install ag
brew install ripgrep
brew install atool
brew install jq
brew install cmake

# fonts
brew cask install font-cica

# Cask Packages
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" keycastr
brew cask install --appdir="/Applications" macvim
brew cask install --appdir="/Applications" shiftit
brew cask install --appdir="/Applications" sketch
brew cask install --appdir="/Applications" sourcetree
brew cask install --appdir="/Applications" visual-studio-code
brew cask install google-japanese-ime
brew cask install karabiner-elements

