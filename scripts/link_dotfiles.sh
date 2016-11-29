#!/usr/bin/env bash

cat <<-'EOT'
     _       _    __ _ _
  __| | ___ | |_ / _(_) | ___  ___
 / _` |/ _ \| __| |_| | |/ _ \/ __|
| (_| | (_) | |_|  _| | |  __/\__ \
 \__,_|\___/ \__|_| |_|_|\___||___/

EOT

# =============================================================================
# check prezto
# =============================================================================
if [ ! -e ~/.config/zsh/.zprezto ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.config/zsh/.zprezto
fi

# =============================================================================
# Create local/bin dir
# =============================================================================
if [ ! -e ~/.config/local/bin ]; then
  echo 'mkdir ~/.config/local/bin'
  mkdir -p ~/.config/local/bin
fi

# =============================================================================
# remove old
# =============================================================================
echo 'remove old dotfiles'
rm -rf ~/.zshenv
rm -rf ~/.tmux.conf
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.gvimrc
rm -rf ~/.xvimrc
rm -rf ~/.editorconfig
rm -rf ~/.tigrc
rm -rf ~/.uncrustify.cfg
rm -rf ~/.tern-project
if [[ "$OSTYPE" != darwin* ]]; then
  rm -rf ~/.Xdefaults
  rm -rf ~/.xprofile
  rm -rf ~/.i3
fi

# =============================================================================
# zsh
# =============================================================================
echo 'link .zshenv'
ln -s ~/.config/zsh/.zshenv ~/.zshenv

# =============================================================================
# vim
# =============================================================================
echo 'link .vim/'
ln -s ~/.config/nvim ~/.vim
echo 'link .vimrc'
ln -s ~/.config/nvim/init.vim ~/.vimrc
echo 'link .gvimrc'
ln -s ~/.config/nvim/gvimrc ~/.gvimrc
echo 'link .xvimrc'
ln -s ~/.config/nvim/xvimrc ~/.xvimrc

# =============================================================================
# tmux
# =============================================================================
echo 'link .tmux.conf'
ln -s ~/.config/cfg/tmux.conf ~/.tmux.conf

# =============================================================================
# editorconfig
# =============================================================================
echo 'link .editorconfig'
if [[ "$OSTYPE" != darwin* ]]; then
  ln -s ~/.config/cfg/editorconfig_arch ~/.editorconfig
else
  ln -s ~/.config/cfg/editorconfig ~/.editorconfig
fi

# =============================================================================
# tig
# =============================================================================
echo 'link .tigrc'
ln -s ~/.config/cfg/tigrc ~/.tigrc

# =============================================================================
# tig
# =============================================================================
echo 'link .tern-project'
ln -s ~/.config/cfg/tern-project ~/.tern-project

# =============================================================================
# uncrustify
# =============================================================================
echo 'link .uncrustify.cfg'
ln -s ~/.config/cfg/uncrustify.cfg ~/.uncrustify.cfg

# =============================================================================
# arch
# =============================================================================
if [[ "$OSTYPE" != darwin* ]]; then
  echo 'link .Xdefaults'
  ln -s ~/.config/arch/Xdefaults ~/.Xdefaults
  echo 'link .xprofile'
  ln -s ~/.config/arch/xprofile ~/.xprofile
  echo 'link .i3/'
  ln -s ~/.config/arch/i3 ~/.i3
fi

