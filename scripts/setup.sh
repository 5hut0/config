#!/bin/bash

cat <<-'EOT'
 ____  _____ _____ _   _ ____
/ ___|| ____|_   _| | | |  _ \
\___ \|  _|   | | | | | | |_) |
 ___) | |___  | | | |_| |  __/
|____/|_____| |_|  \___/|_|
EOT

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
  # Homebrew
  sh ~/.config/scripts/setup_homebrew.sh

  # macOS theme
  sh ~/.config/scripts/setup_macos_theme.sh

  # fish
  sh ~/.config/scripts/setup_fish.sh

  # nodenv
  sh ~/.config/scripts/setup_node.sh
fi

#==============================================================================
# dotfiles
#==============================================================================
sh ~/.config/scripts/link_dotfiles.sh

#==============================================================================
# Kill affected applications
#==============================================================================
if [[ "$OSTYPE" == darwin* ]]; then
  for app in "cfprefsd" "Dock" "Finder" "Google Chrome" "Safari" "SystemUIServer" "Terminal" ; do
    killall "${app}" > /dev/null 2>&1
  done
  echo "logout/restart to take effect."
fi
