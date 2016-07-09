#!/usr/bin/env bash

cat <<-'EOT'
 _   _           _         _
| \ | | ___   __| | ___   (_)___
|  \| |/ _ \ / _` |/ _ \  | / __|
| |\  | (_) | (_| |  __/_ | \__ \
|_| \_|\___/ \__,_|\___(_)/ |___/
                        |__/
EOT

# nodebrew設定
export PATH=$HOME/.nodebrew/current/bin:$PATH
nodebrew install-binary stable

# npm packages
nodebrew use stable

