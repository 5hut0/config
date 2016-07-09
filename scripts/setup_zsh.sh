#!/usr/bin/env bash

cat <<-'EOT'
         _
 _______| |__
|_  / __| '_ \
 / /\__ \ | | |
/___|___/_| |_|

EOT

git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.config/zsh/.zprezto

sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s /usr/local/bin/zsh
zsh --version

