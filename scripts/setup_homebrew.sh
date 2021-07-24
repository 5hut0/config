#!/bin/bash

cat <<-'EOT'
 _   _                      _
| | | | ___  _ __ ___   ___| |__  _ __ _____      __
| |_| |/ _ \| '_ ` _ \ / _ \ '_ \| '__/ _ \ \ /\ / /
|  _  | (_) | | | | | |  __/ |_) | | |  __/\ V  V /
|_| |_|\___/|_| |_| |_|\___|_.__/|_|  \___| \_/\_/

EOT

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

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
brew install vim

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

# node
brew install nodenv

# fonts
brew tap homebrew/cask-fonts
brew install font-cica

# Cask Packages
brew install --cask alfred
# brew install --cask google-chrome
brew install --cask keycastr
brew install --cask macvim
# brew install --cask sketch
brew install --cask sourcetree
brew install --cask visual-studio-code
brew install --cask google-japanese-ime
brew install --cask karabiner-elements

