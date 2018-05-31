#!/usr/bin/env bash

cat <<-'EOT'
 _                      _             _
| |_ ___ _ __ _ __ ___ (_)_ __   __ _| |
| __/ _ \ '__| '_ ` _ \| | '_ \ / _` | |
| ||  __/ |  | | | | | | | | | | (_| | |
 \__\___|_|  |_| |_| |_|_|_| |_|\__,_|_|

EOT

# Keep-alive: update existing `sudo` time stamp until
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

echo "Only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

echo "Solarized Dark theme by default in Terminal.app"

osascript <<EOD

tell application "Terminal"

  local allOpenedWindows
  local initialOpenedWindows
  local windowID

  set themeName to "Solarized Dark xterm-256color"

  (* Store the IDs of all the open terminal windows. *)
  set initialOpenedWindows to id of every window

  (* Open the custom theme so that it gets added to the list
    of available terminal themes (note: this will open two
    additional terminal windows). *)
  do shell script "open '$HOME/.config/etc/colors/Solarized/" & themeName & ".terminal'"

  (* Wait a little bit to ensure that the custom theme is added. *)
  delay 1

  (* Set the custom theme as the default terminal theme. *)
  set default settings to settings set themeName

  (* Get the IDs of all the currently opened terminal windows. *)
  set allOpenedWindows to id of every window

  repeat with windowID in allOpenedWindows

    (* Close the additional windows that were opened in order
      to add the custom theme to the list of terminal themes. *)
    if initialOpenedWindows does not contain windowID then
      close (every window whose id is windowID)

    (* Change the theme for the initial opened terminal windows
      to remove the need to close them in order for the custom
      theme to be applied. *)
    else
      set current settings of tabs of (every window whose id is windowID) to settings set themeName
    end if

  end repeat

end tell

EOD
