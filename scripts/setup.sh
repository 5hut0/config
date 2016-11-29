#!/usr/bin/env bash
cat <<-'EOT'
 ____  _____ _____ _   _ ____
/ ___|| ____|_   _| | | |  _ \
\___ \|  _|   | | | | | | |_) |
 ___) | |___  | | | |_| |  __/
|____/|_____| |_|  \___/|_|
EOT

#==============================================================================
# Xcode Command Line Tools
#==============================================================================
if [[ "$OSTYPE" == darwin* ]]; then
  open -a Xcode.app
  xcode-select --install
  echo "Check Xcode term and Install Command Line Tools"
  read wait
fi

#==============================================================================
# Clone config file
#==============================================================================
git clone https://github.com/5hut0/config.git ~/.config
cd ~/.config
git submodule init
git submodule update --init --recursive

#==============================================================================
# macOS
#==============================================================================
if [[ "$OSTYPE" == darwin* ]]; then
  #==============================================================================
  # Homebrew
  #==============================================================================
  sh ~/.config/scripts/setup_homebrew.sh

  #==============================================================================
  # macOS theme
  #==============================================================================
  sh ~/.config/scripts/setup_macos_theme.sh

  #==============================================================================
  # macOS apps
  #==============================================================================
  sh ~/.config/scripts/setup_iterm.sh
  sh ~/.config/scripts/setup_karabiner.sh
  sh ~/.config/scripts/setup_macos_dock.sh
  sh ~/.config/scripts/setup_alfred.sh
  sh ~/.config/scripts/setup_sublimetext.sh
  sh ~/.config/scripts/setup_icloud_files.sh

  #==============================================================================
  # zsh
  #==============================================================================
  sh ~/.config/scripts/setup_zsh.sh
fi

#==============================================================================
# dotfiles
#==============================================================================
sh ~/.config/scripts/link_dotfiles.sh

#==============================================================================
# Node.js
#==============================================================================
sh ~/.config/scripts/install_npm_global.sh

#==============================================================================
# Kill affected applications
#==============================================================================
if [[ "$OSTYPE" == darwin* ]]; then
  for app in "cfprefsd" "Dock" "Finder" "Google Chrome" "Safari" "SystemUIServer" "Terminal" ; do
    killall "${app}" > /dev/null 2>&1
  done
  echo "logout/restart to take effect."
fi
