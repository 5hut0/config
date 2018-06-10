# set PATH ~/.config/bin ~/.config/local/bin $HOME/.cargo/bin $PATH
set PATH ~/.config/bin ~/.config/local/bin $PATH
abbr ta 'tig --all'
abbr ts 'tig status'
alias vi='vim'
set -U EDITOR vim
set -U VISUAL vim

set -U FZF_DEFAULT_COMMAND 'ag --nocolor -g ""'
set -U FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -U FZF_ALT_C_COMMAND "$FZF_DEFAULT_COMMAND"
# set -U FZF_DEFAULT_OPTS '--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254 --color info:254,prompt:37,spinner:108,pointer:235,marker:235'
set -U FZF_DEFAULT_OPTS '--color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33 --color info:136,prompt:136,pointer:230,marker:230,spinner:136'
set -U FZF_TMUX 1

