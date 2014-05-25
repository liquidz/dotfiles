#!/bin/sh

INSTALL_DIR=$HOME/dotfiles

if [ ! -e $INSTALL_DIR ]; then
    git clone https://github.com/liquidz/dotfiles.git $INSTALL_DIR
    (cd $INSTALL_DIR && git submodule update --init)
fi

# link config
mkdir -p $HOME/.config/fish
ln -sf $INSTALL_DIR/config.fish $HOME/.config/fish/config.fish
