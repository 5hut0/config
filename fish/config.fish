# path
fish_add_path ~/.config/bin
fish_add_path ~/.config/local/bin
fish_add_path ~/.local/bin

# disable greeting message
set fish_greeting

abbr - 'cd (git rev-parse --show-toplevel)'

# tig
abbr ta 'tig --all'
abbr ts 'tig status'

abbr t 'asynctask -f'
abbr r 'asynctask'
abbr push 'git push origin'
abbr pull 'git pull origin'
abbr fetch 'git fetch origin'
abbr fetch 'git fetch origin'
abbr merge 'git merge'
abbr co 'git checkout'
abbr cob 'git checkout -b'

# Editor
alias vi='nvim'
alias vim='nvim'
set -U EDITOR nvim
set -U VISUAL nvim

# fzf
set -U FZF_DEFAULT_COMMAND 'ag --nocolor -g ""'
set -U FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -U FZF_ALT_C_COMMAND "$FZF_DEFAULT_COMMAND"
set -U FZF_DEFAULT_OPTS '--color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33 --color info:136,prompt:136,pointer:230,marker:230,spinner:136'
set -U FZF_TMUX 1

# homebrew
fish_add_path /opt/homebrew/bin
eval (/opt/homebrew/bin/brew shellenv)

# nodenv
eval (nodenv init - | source)
set -x PATH (yarn global bin) $PATH

# llvm
fish_add_path /opt/homebrew/opt/llvm/bin

# cargo
fish_add_path ~/.cargo/bin
