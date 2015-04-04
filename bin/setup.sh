#!/usr/bin/env bash

#   ____   __  ____  ____  __  __    ____  ____ 
#  (    \ /  \(_  _)(  __)(  )(  )  (  __)/ ___)
#   ) D ((  O ) )(   ) _)  )( / (_/\ ) _) \___ \
#  (____/ \__/ (__) (__)  (__)\____/(____)(____/
#
# ==================================================

if [[ "$PREFIX" = "" ]]; then
    PREFIX="$HOME"
fi
INSTALL_DIR=$PREFIX/src/github.com/liquidz/dotfiles
DOT_FILES=(".vimrc" ".tmux.conf" ".zshenv" ".zshrc" ".zshrc.antigen" ".peco" ".ctags" ".gemrc" ".rubocop.yml")
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

## git が未インストールなら終了
if [ ! -x "`which git`" ]; then
    cecho $red "Error: git is not installed"
    exit 1
fi

## インストールモードの確認
## full モード以外では dotfiles のシンボリックリンクのみ貼る
if [[ "$MODE" = "min" ]]; then
    MODE="minimal"
else
    MODE="full"
fi
cecho $green "Start: ${MODE} setup"

## dotfiles レポジトリの clone
cecho $yellow " * cloning dotfiles"
if [ ! -e $INSTALL_DIR ]; then
    git clone https://github.com/liquidz/dotfiles.git $INSTALL_DIR > /dev/null 2>&1
else
    (cd $INSTALL_DIR && git pull origin master > /dev/null 2>&1)
fi

## dotfiles のシンボリックリンクを貼る
cecho $yellow " * create symbolic links to dotfiles"
for file in ${DOT_FILES[@]}; do
    ln -sfn $INSTALL_DIR/$file $PREFIX/$file
done
cecho $yellow " * create symbolic links to .lein/profiles.clj"
if [ ! -e "$PREFIX/.lein" ]; then
    mkdir -p $PREFIX/.lein
fi
ln -sfn $INSTALL_DIR/.lein/profiles.clj $PREFIX/.lein/profiles.clj

## full モードなら全設定のセットアップ
if [ "${MODE}" == "full" ]; then
    ## vim の設定
    cecho $yellow " * initializing vim"
    ln -sfn $INSTALL_DIR/.vim $PREFIX/.vim
    mkdir -p $PREFIX/.vim/bundle
    mkdir -p $PREFIX/.vim/backup
    mkdir -p $PREFIX/.tags

    cecho $yellow " * settingup vim memo"
    if [[ -e ~/Dropbox/vim/memo ]] && [[ "$IS_TEST" = "" ]]; then
        ln -sfn ~/Dropbox/vim/memo $PREFIX/.vim/memo
    else
        mkdir -p $PREFIX/.vim/memo
        touch $PREFIX/.vim/memo/default.md
    fi

    cecho $yellow " * cloning vim-plug"
    DIR="$PREFIX/.vim/autoload/plug.vim"
    if [[ ! -e $DIR ]]; then
        curl -sfLo $DIR --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    ## tmux の設定
    cecho $yellow " * cloning tpm"
    DIR="$PREFIX/.tmux/plugins/tpm"
    if [ ! -e $DIR ]; then
        git clone https://github.com/tmux-plugins/tpm $DIR
    fi

    ## zsh の設定
    cecho $yellow " * cloning antigen"
    DIR="$PREFIX/src/github.com/zsh-users/antigen"
    if [ ! -e $DIR ]; then
        git clone https://github.com/zsh-users/antigen.git $DIR
    fi

    #cecho $yellow " * getting manuals for vim-ref"
    #mkdir -p $PREFIX/.vim/vim-ref
    #if [ ! -e $PREFIX/.vim/vim-ref/php-chunked-xhtml ]; then
    #    wget http://jp2.php.net/get/php_manual_ja.tar.gz/from/jp1.php.net/mirror -O /tmp/php-chunked-xhtml
    #    (cd $PREFIX/.vim/vim-ref && tar xvf /tmp/php-chunked-xhtml)
    #    /bin/rm -f /tmp/php-chunked-xhtml
    #fi

    cecho $yellow " * git config"
    git config --global ghq.root ~/src
    git config --global github.user liquidz
    git config --global push.default current
fi

cecho $green "Done"
