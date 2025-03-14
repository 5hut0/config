#!/bin/bash

cat <<-'EOT'
 _   _           _         _     
| \ | | ___   __| | ___   (_)___ 
|  \| |/ _ \ / _` |/ _ \  | / __|
| |\  | (_) | (_| |  __/_ | \__ \
|_| \_|\___/ \__,_|\___(_)/ |___/
                        |__/     
EOT

nodenv init
eval (nodenv init - | source)

nodenv install 21.7.3
nodenv global 21.7.3

npm install -g yarn

