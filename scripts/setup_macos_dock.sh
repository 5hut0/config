#!/usr/bin/env bash

cat <<-'EOT'
 ____             _
|  _ \  ___   ___| | __
| | | |/ _ \ / __| |/ /
| |_| | (_) | (__|   <
|____/ \___/ \___|_|\_\

EOT

# Keep-alive: update existing `sudo` time stamp until
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

ln -s ~/.config/etc/dockutil/scripts/dockutil /usr/local/bin/dockutil

dockutil --remove all --no-restart

dockutil --add "/Applications/App Store.app" --no-restart
dockutil --add "/Applications/System Preferences.app" --no-restart
dockutil --add "/Applications/Launchpad.app" --no-restart
dockutil --add "/Applications/Mission Control.app" --no-restart

dockutil --add "/Applications/Safari.app" --no-restart
dockutil --add "/Applications/Google Chrome.app" --no-restart

dockutil --add "/Applications/Xcode.app" --no-restart
dockutil --add "/Applications/iTerm.app" --no-restart

dockutil --add "/Applications/Airmail 2.app" --no-restart
dockutil --add "/Applications/Messages.app" --no-restart
dockutil --add "/Applications/Calendar.app" --no-restart



dockutil --add /Applications --sort name --view list --display folder --no-restart
dockutil --add ~/Downloads --sort dateadded --view fan --display stack
