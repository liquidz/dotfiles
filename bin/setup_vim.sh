#!/bin/sh

INSTALL_DIR=$HOME/dotfiles

if [ ! -e $INSTALL_DIR ]; then
    git clone https://github.com/liquidz/dotfiles.git $INSTALL_DIR
fi

ln -s $HOME/dotfiles/.vim $HOME/.vim

mkdir -p $HOME/.vim/bundle
mkdir -p $HOME/.vim/backup

if [ ! -e $HOME/.vim/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim
fi

ln -sf $INSTALL_DIR/.minimal_vimrc $HOME/.vimrc
