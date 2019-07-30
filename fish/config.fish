# path
set PATH ~/.config/bin ~/.config/local/bin $PATH
set PATH ~/.nodebrew/current/bin $PATH
set NODEBREW_ROOT /usr/local/var/nodebrew

# tig
abbr ta 'tig --all'
abbr ts 'tig status'

# Sketch
abbr sketchtool '/Applications/Sketch.app/Contents/Resources/sketchtool/bin/sketchtool'
abbr sketchmigrate '/Applications/Sketch.app/Contents/Resources/sketchtool/bin/sketchmigrate'

# Editor
alias vi='vim'
set -U EDITOR vim
set -U VISUAL vim

# fzf
set -U FZF_DEFAULT_COMMAND 'ag --nocolor -g ""'
set -U FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -U FZF_ALT_C_COMMAND "$FZF_DEFAULT_COMMAND"
set -U FZF_DEFAULT_OPTS '--color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33 --color info:136,prompt:136,pointer:230,marker:230,spinner:136'
set -U FZF_TMUX 1

