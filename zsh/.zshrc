#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if (( $+commands[figlet] )); then
  uname -n | sed "s/.local//" | figlet
fi

# nodebrew
if (( $+commands[nodebrew] )); then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# path
export PATH=$HOME/.config/bin:$PATH
export PATH=$HOME/.config/local/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"


alias subl='reattach-to-user-namespace subl'
alias t='tig'
alias ta='tig --all'
alias ts='tig status'
alias prty='uncrustify --replace --no-backup'
alias pqall='find . -name "*.png" -type f | xargs pngquant --ext .png --verbose --force'
alias gf='git-flow'

bindkey -v
bindkey 'jj' vi-cmd-mode

zle -A .backward-kill-word vi-backward-kill-word
zle -A .backward-delete-char vi-backward-delete-char
