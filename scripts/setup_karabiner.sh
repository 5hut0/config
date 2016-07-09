#!/usr/bin/env bash

cat <<-'EOT'
 _                   _     _
| | ____ _ _ __ __ _| |__ (_)_ __   ___ _ __
| |/ / _` | '__/ _` | '_ \| | '_ \ / _ \ '__|
|   < (_| | | | (_| | |_) | | | | |  __/ |
|_|\_\__,_|_|  \__,_|_.__/|_|_| |_|\___|_|

EOT

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.shiftEscape2tilde 1

$cli set repeat.wait 10

$cli set repeat.initial_wait 300

$cli set repeat.consumer_wait 70

$cli set option.vimode_control_hjkl 1


