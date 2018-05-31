#!/bin/bash

cat <<-'EOT'
     _       _    __ _ _
  __| | ___ | |_ / _(_) | ___  ___
 / _` |/ _ \| __| |_| | |/ _ \/ __|
| (_| | (_) | |_|  _| | |  __/\__ \
 \__,_|\___/ \__|_| |_|_|\___||___/

EOT

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
rm -rf ~/.tmux.conf
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.gvimrc
rm -rf ~/.xvimrc
rm -rf ~/.editorconfig
rm -rf ~/.tigrc
rm -rf ~/.uncrustify.cfg
rm -rf ~/.agignore
rm -rf ~/.tern-project

# =============================================================================
# vim
# =============================================================================
echo 'link .vim/'
ln -s ~/.config/vim ~/.vim

echo 'link .vimrc'
ln -s ~/.config/vim/init.vim ~/.vimrc
ln -s ~/.config/cfg/color_coded ~/.color_coded
ln -s ~/.config/cfg/agignore ~/.agignore

echo 'link .gvimrc'
ln -s ~/.config/vim/gvimrc ~/.gvimrc

echo 'link .xvimrc'
ln -s ~/.config/vim/xvimrc ~/.xvimrc

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

