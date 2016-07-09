#!/usr/bin/env bash

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

# Add Repository
brew tap caskroom/cask
brew tap homebrew/binary
brew tap homebrew/x11

# Brew Update
brew update

# Brew Cask
brew install brew-cask

# lib
brew install --without-x11 cairo
brew install --without-x11 pango

# terminal
brew install reattach-to-user-namespace
brew install zsh
brew install tmux
brew install fasd
brew install figlet
brew install peco
brew install tree
brew Install htop
brew install highlight
brew install gnu-sed

# ranger
brew install ranger
brew install lynx
brew install w3m
brew install libcaca --with-imlib2
brew install mediainfo
brew install xpdf
brew install imlib2

# files
brew install nkf
brew install atool

# version
brew install git
brew install git-now
brew install git-flow
brew install git-secrets
brew install tig
brew install subversion

# editors
brew install neovim/neovim/neovim
brew install vim --with-lua
brew install macvim --with-lua

# tools
brew install gpg
brew install curl
brew install wget

# images
brew install pngquant
brew install imagemagick

# js
brew install nodebrew
brew install phantomjs
brew install jq
brew install jo

# C/C++
brew install uncrustify

# python
brew install python
brew install python3
pip install neovim

# web dev
brew install tidy-html5
brew install linkchecker
brew install googlecl

# fonts
brew tap sanemat/font
brew install --powerline --vim-powerline ricty

brew linkapps macvim

# Cask Packages
brew cask install --appdir="/Applications" shiftit
brew cask install --appdir="/Applications" karabiner
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" texturepacker
brew cask install --appdir="/Applications" kaleidoscope
# brew cask install --appdir="/Applications" adobe-creative-cloud
brew cask install --appdir="/Applications" mou
brew cask install --appdir="/Applications" marked
brew cask install --appdir="/Applications" keycastr

brew cask install sketch-tool
brew cask install google-japanese-ime
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install qlimagesize
brew cask install webpquicklook
brew cask install suspicious-package
brew cask install provisionql

echo "Copy Ricty Font"
cp -f /usr/local/Cellar/ricty/*/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

if ! pgrep -q Karabiner; then
  sql="
    INSERT OR REPLACE INTO access
    VALUES('kTCCServiceAccessibility','org.pqrs.Karabiner-AXNotifier',0,1,0,NULL);
  "
  sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "${sql}"
  open -a Karabiner.app
fi

# open /opt/homebrew-cask/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app

