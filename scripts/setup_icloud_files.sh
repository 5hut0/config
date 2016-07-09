#!/usr/bin/env bash

cat <<-'EOT'
 _  ____ _                 _   _____ _ _
(_)/ ___| | ___  _   _  __| | |  ___(_) | ___  ___
| | |   | |/ _ \| | | |/ _` | | |_  | | |/ _ \/ __|
| | |___| | (_) | |_| | (_| | |  _| | | |  __/\__ \
|_|\____|_|\___/ \__,_|\__,_| |_|   |_|_|\___||___/

EOT

if [ -e ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/dotfiles ]; then
  cp ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/dotfiles/etc/Alfred/license.plist ~/Library/Application\ Support/Alfred\ 3/license.plist
  mkdir ~/Library/Application\ Support/Kaleidoscope
  cp ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/dotfiles/etc/Kaleidoscope/License.plist ~/Library/Application\ Support/Kaleidoscope/License.plist
  cp ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/dotfiles/etc/SublimeText3/SFTP.sublime-settings ~/.config/cfg/SublimeText/Packages/User/SFTP.sublime-settings
  cp ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/dotfiles/etc/SublimeText3/SVN.sublime-settings ~/.config/cfg/SublimeText/Packages/User/SVN.sublime-settings
  cp ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/dotfiles/etc/SublimeText3/License.sublime_license ~/.config/cfg/SublimeText/Local/License.sublime_license
  open -a Alfred\ 3
fi



