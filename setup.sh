#/bin/sh

INSTALL_DIR=$HOME/dotfiles

git clone https://github.com/liquidz/dotfiles.git $INSTALL_DIR

mkdir -p $HOME/.vim/bundle
mkdir -p $HOME/.backup

if [ ! -e $HOME/.vim/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim
fi

ln -s $INSTALL_DIR/.vimrc $HOME/.vimrc
