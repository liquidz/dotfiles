#!/bin/sh

#==================================================
# sh ./setup.sh                    => minimal setup
# env MODE=full sh ./setup.sh full => full setup
#==================================================

INSTALL_DIR=$HOME/dotfiles
# colors {{{
red=31
green=32
yellow=33
blue=34
# }}}
cecho() { # {{{
    color=$1
    shift
    echo -e "\033[${color}m$@\033[m"
} # }}}

recommended() {
    cecho $green "Recommended operations:"
    cat <<EOT
 $ git config --global github.user liquidz
 $ go get github.com/nsf/gocode
EOT
}

if [ "${MODE}" == "" ]; then
    MODE="minimal"
fi

cecho $green "Start: ${MODE} setup"

cecho $yellow " * cloning dotfiles"
if [ ! -e $INSTALL_DIR ]; then
    git clone https://github.com/liquidz/dotfiles.git $INSTALL_DIR
fi

cecho $yellow " * create symbolic links to dotfiles"
for file in ".vimrc" ".tmux.conf" ".zshenv" ".zshrc"; do
    ln -sfn $INSTALL_DIR/$file $HOME/$file
done

if [ "${MODE}" == "full" ]; then
    cecho $yellow " * initializing vim"
    ln -sfn $INSTALL_DIR/.vim $HOME/.vim
    mkdir -p $HOME/.vim/bundle
    mkdir -p $HOME/.vim/backup

    cecho $yellow " * cloning neobundle"
    if [ ! -e $HOME/.vim/bundle/neobundle.vim ]; then
        git clone https://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim
    fi

    recommended
fi

cecho $green "Done"
