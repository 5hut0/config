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

# :)
brew install reattach-to-user-namespace
brew install fish
brew install tmux
brew install fzf
brew install z
brew install figlet
brew install peco
brew install tree
brew Install htop
brew install highlight
brew install gnu-sed
brew install ranger
brew install lynx
brew install w3m
brew install libcaca --with-imlib2
brew install mediainfo
brew install imlib2
brew install ag
brew install xz
brew install nkf
brew install git
brew install git-flow
brew install tig
brew install gpg
brew install curl
brew install wget
brew install --without-x11 cairo
brew install --without-x11 pango

# editors
brew install vim --with-lua

# images
brew install pngquant
brew install imagemagick

# dev
brew install atool
brew install jq
brew install jo
brew install rust
brew install cmake
brew install node
brew install go
brew install python
brew install python3
brew install uncrustify
brew install mono

# fonts
brew tap sanemat/font
brew install ricty --with-powerline

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

brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install quicklook-csv
brew cask install qlimagesize
brew cask install webpquicklook
brew cask install suspicious-package
brew cask install provisionql
brew cask install quicklookapk

echo "Copy Ricty Font"
cp -f /usr/local/Cellar/ricty/*/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

