#!/bin/bash

cat <<-'EOT'
 ____            _   
|  _ \ _   _ ___| |_ 
| |_) | | | / __| __|
|  _ <| |_| \__ \ |_ 
|_| \_\\__,_|___/\__|
EOT

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

