#!/bin/bash

cat <<-'EOT'
  __ _     _               _          _ _
 / _(_)___| |__        ___| |__   ___| | |
| |_| / __| '_ \ _____/ __| '_ \ / _ \ | |
|  _| \__ \ | | |_____\__ \ | | |  __/ | |
|_| |_|___/_| |_|     |___/_| |_|\___|_|_|

EOT

sudo sh -c "echo '/usr/local/bin/fish' >> /etc/shells"
chsh -s /opt/homebrew/bin/fish
fish --version

