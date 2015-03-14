#!/usr/bin/env bash

#==================================================
# sh ./setup.sh                    => minimal setup
# env MODE=full sh ./setup.sh full => full setup
#==================================================

INSTALL_DIR=$HOME/src/github.com/liquidz/dotfiles
DOT_FILES=(".vimrc" ".tmux.conf" ".zshenv" ".zshrc" ".peco" ".ctags")
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

if [ ! -x "`which git`" ]; then
    cecho $red "Error: git is not installed"
    exit 1
fi

if [ "${MODE}" == "" ]; then
    MODE="minimal"
fi

cecho $green "Start: ${MODE} setup"

cecho $yellow " * cloning dotfiles"
if [ ! -e $INSTALL_DIR ]; then
    git clone https://github.com/liquidz/dotfiles.git $INSTALL_DIR
else
    (cd $INSTALL_DIR && git pull origin master)
fi

cecho $yellow " * create symbolic links to dotfiles"
for file in ${DOT_FILES[@]}; do
    ln -sfn $INSTALL_DIR/$file $HOME/$file
done

cecho $yellow " * create symbolic links to .lein/profiles.clj"
if [ ! -e "$HOME/.lein" ]; then
    mkdir -p ~/.lein
fi
ln -sfn $INSTALL_DIR/.lein/profiles.clj $HOME/.lein/profiles.clj

if [ "${MODE}" == "full" ]; then
    cecho $yellow " * initializing vim"
    ln -sfn $INSTALL_DIR/.vim $HOME/.vim
    mkdir -p $HOME/.vim/bundle
    mkdir -p $HOME/.vim/backup
    mkdir -p $HOME/.vim/memo
    mkdir -p $HOME/.tags
    touch $HOME/.vim/memo/default.md

    cecho $yellow " * cloning neobundle"
    if [ ! -e $HOME/.vim/bundle/neobundle.vim ]; then
        git clone https://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim
    fi

    cecho $yellow " * cloning tpm"
    if [ ! -e $HOME/.tmux/plugins/tpm ]; then
        git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    fi

    #cecho $yellow " * getting manuals for vim-ref"
    #mkdir -p $HOME/.vim/vim-ref
    #if [ ! -e $HOME/.vim/vim-ref/php-chunked-xhtml ]; then
    #    wget http://jp2.php.net/get/php_manual_ja.tar.gz/from/jp1.php.net/mirror -O /tmp/php-chunked-xhtml
    #    (cd $HOME/.vim/vim-ref && tar xvf /tmp/php-chunked-xhtml)
    #    /bin/rm -f /tmp/php-chunked-xhtml
    #fi

    cecho $yellow " * git config"
    git config --global ghq.root ~/src
    git config --global github.user liquidz
fi

cecho $green "Done"
