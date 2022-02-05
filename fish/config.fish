# path
set PATH ~/.config/bin ~/.config/local/bin $PATH

# disable greeting message
set fish_greeting

# tig
abbr ta 'tig --all'
abbr ts 'tig status'

abbr task 'asynctask -f'
abbr push 'git push origin'
abbr pull 'git pull origin'

# Sketch
# alias juce='/Applications/JUCE/Projucer.app/Contents/MacOS/Projucer'

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

set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths

fish_add_path /opt/homebrew/bin
eval (/opt/homebrew/bin/brew shellenv)

# nodenv
eval (nodenv init - | source)

# pyenv
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH  $PYENV_ROOT/bin $PATH
pyenv init - | source

# llvm
fish_add_path /opt/homebrew/opt/llvm/bin
# set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
# set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

