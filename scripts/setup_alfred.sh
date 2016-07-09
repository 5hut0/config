#!/usr/bin/env bash

cat <<-'EOT'
    _    _  __              _   _____
   / \  | |/ _|_ __ ___  __| | |___ /
  / _ \ | | |_| '__/ _ \/ _` |   |_ \
 / ___ \| |  _| | |  __/ (_| |  ___) |
/_/   \_\_|_| |_|  \___|\__,_| |____/

EOT

echo "Copy Alfred 3 Preferences"
mkdir ~/Library/Application\ Support/Alfred\ 3
ln -s ~/.config/cfg/Alfred/Alfred.alfredpreferences ~/Library/Application\ Support/Alfred\ 3/Alfred.alfredpreferences
