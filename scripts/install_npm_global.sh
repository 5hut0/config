#!/usr/bin/env bash

cat <<-'EOT'
                         _           _        _ _
 _ __  _ __  _ __ ___   (_)_ __  ___| |_ __ _| | |         __ _
| '_ \| '_ \| '_ ` _ \  | | '_ \/ __| __/ _` | | |  _____ / _` |
| | | | |_) | | | | | | | | | | \__ \ || (_| | | | |_____| (_| |
|_| |_| .__/|_| |_| |_| |_|_| |_|___/\__\__,_|_|_|        \__, |
      |_|                                                 |___/
EOT

echo 'npm install -g'
echo 'coffee-script gulp coffeelint eslint js-beautify babel-core webpack'
npm install -g coffee-script gulp coffeelint eslint js-beautify babel-core webpack

